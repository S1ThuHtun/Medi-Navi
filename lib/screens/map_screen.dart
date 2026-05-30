import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import '../models/medical_service.dart';
import '../services/google_places_service.dart';
import '../l10n/app_localizations.dart';

class MapScreen extends StatefulWidget {
  final MedicalService service;
  final Position currentPosition;

  const MapScreen({
    super.key,
    required this.service,
    required this.currentPosition,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  final GooglePlacesService _placesService = GooglePlacesService();
  bool _showDirections = false;
  Map<String, dynamic>? _directionsData;
  List<LatLng> _routePoints = [];
  bool _isLoadingDirections = false;
  String _selectedTravelMode = 'driving';
  Map<String, dynamic>? _placeDetails;

  @override
  void initState() {
    super.initState();
    // Center map on selected service location
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _centerOnService();
      _fetchPlaceDetails();
    });
  }

  Future<void> _fetchPlaceDetails() async {
    final details = await _placesService.getPlaceDetails(widget.service.id);

    if (details != null && mounted) {
      setState(() {
        _placeDetails = details;
      });
    }
  }

  void _centerOnService() {
    _mapController.move(
      LatLng(widget.service.latitude, widget.service.longitude),
      14.0,
    );
    // Force a rebuild to ensure tiles load
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {});
      }
    });
  }

  void _centerMapOnRoute() {
    final bounds = LatLngBounds(
      LatLng(widget.currentPosition.latitude, widget.currentPosition.longitude),
      LatLng(widget.service.latitude, widget.service.longitude),
    );

    _mapController.fitCamera(
      CameraFit.bounds(
        bounds: bounds,
        padding: const EdgeInsets.all(100),
      ),
    );
  }

  void _zoomIn() {
    final currentZoom = _mapController.camera.zoom;
    _mapController.move(_mapController.camera.center, currentZoom + 1);
  }

  void _zoomOut() {
    final currentZoom = _mapController.camera.zoom;
    _mapController.move(_mapController.camera.center, currentZoom - 1);
  }

  void _goToUserLocation() {
    _mapController.move(
      LatLng(widget.currentPosition.latitude, widget.currentPosition.longitude),
      14.0,
    );
  }

  Future<void> _getDirections() async {
    setState(() {
      _isLoadingDirections = true;
      _showDirections = true;
    });

    print('🚗 Getting directions for mode: $_selectedTravelMode');
    print('📍 From: ${widget.currentPosition.latitude}, ${widget.currentPosition.longitude}');
    print('📍 To: ${widget.service.latitude}, ${widget.service.longitude}');

    final directions = await _placesService.getDirections(
      startLat: widget.currentPosition.latitude,
      startLng: widget.currentPosition.longitude,
      endLat: widget.service.latitude,
      endLng: widget.service.longitude,
      mode: _selectedTravelMode,
    );

    print('📦 Directions response: ${directions != null ? 'Received' : 'Null'}');
    if (directions != null) {
      print('📊 Status: ${directions['status']}');
      print('📊 Routes: ${directions['routes']?.length ?? 0}');
    }

    if (directions != null &&
        directions['status'] == 'OK' &&
        directions['routes'] != null &&
        directions['routes'].isNotEmpty) {

      print('✅ Valid route found, decoding polyline...');

      try {
        final polylinePoints = directions['routes'][0]['overview_polyline']['points'];
        final decodedPoints = _decodePolyline(polylinePoints);

        print('✅ Decoded ${decodedPoints.length} points');

        setState(() {
          _directionsData = directions;
          _routePoints = decodedPoints;
        });

        _centerMapOnRoute();

        print('✅ Route displayed successfully');
      } catch (e) {
        print('❌ Error decoding polyline: $e');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error processing route: $e'),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      }
    } else {
      // Handle errors
      print('⚠️ No valid route found');

      if (mounted) {
        String errorMessage = 'Unable to get directions';
        Color errorColor = Colors.orange;

        if (directions != null && directions['status'] != null) {
          final status = directions['status'];
          final apiError = directions['error_message'];

          print('⚠️ API Status: $status');
          if (apiError != null) print('⚠️ API Error: $apiError');

          switch (status) {
            case 'ZERO_RESULTS':
              if (_selectedTravelMode == 'transit') {
                final distance = widget.service.distance;
                errorMessage = 'Transit not available for this route (${distance.toStringAsFixed(1)} km).\n\n'
                    'Possible reasons:\n'
                    '• No public transit between these locations\n'
                    '• Distance may be too far for transit\n'
                    '• Transit data unavailable for this area\n\n'
                    'Try: Driving or Walking mode instead';
              } else if (_selectedTravelMode == 'bicycling') {
                errorMessage = 'Bicycling directions not available.\nTry walking or driving mode.';
              } else {
                errorMessage = 'No route found for $_selectedTravelMode mode';
              }
              break;
            case 'NOT_FOUND':
              errorMessage = 'Location not found';
              errorColor = Colors.red;
              break;
            case 'REQUEST_DENIED':
              errorMessage = 'API request denied: ${apiError ?? 'Check API key'}';
              errorColor = Colors.red;
              break;
            case 'INVALID_REQUEST':
              errorMessage = 'Invalid request: ${apiError ?? 'Unknown error'}';
              errorColor = Colors.red;
              break;
            case 'OVER_QUERY_LIMIT':
              errorMessage = 'API quota exceeded. Please try again later.';
              errorColor = Colors.red;
              break;
            default:
              errorMessage = 'Error: $status${apiError != null ? '\n$apiError' : ''}';
          }
        } else if (_selectedTravelMode == 'transit') {
          errorMessage = 'Transit directions not available.\nThis may be due to:\n• No public transit in this area\n• Transit data not available\n• Try driving or walking instead';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: errorColor,
            duration: const Duration(seconds: 5),
          ),
        );

        // Clear previous route if any
        setState(() {
          _routePoints = [];
          _directionsData = null;
        });
      }
    }

    setState(() => _isLoadingDirections = false);
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0;
    int len = encoded.length;
    int lat = 0;
    int lng = 0;

    while (index < len) {
      int b;
      int shift = 0;
      int result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return points;
  }


  @override
  Widget build(BuildContext context) {
    // Calculate dynamic height based on content
    final screenHeight = MediaQuery.of(context).size.height;
    final baseHeight = 320.0; // Base height for basic info
    final travelModeHeight = _showDirections ? 90.0 : 0.0; // Height for travel mode selector
    final googleMapsButtonHeight = _showDirections ? 48.0 : 0.0; // Height for "Open in Google Maps" button

    // Calculate height for enhanced details (website, reviews, accessibility)
    double enhancedDetailsHeight = 0.0;
    if (_placeDetails != null) {
      if (_placeDetails!['website'] != null) enhancedDetailsHeight += 30.0;
      if (_placeDetails!['wheelchair_accessible_entrance'] != null) enhancedDetailsHeight += 30.0;
    }

    final totalContentHeight = baseHeight + travelModeHeight + googleMapsButtonHeight + enhancedDetailsHeight;

    // Calculate min and max child sizes dynamically
    final minChildSize = 0.1;
    final maxChildSize = (totalContentHeight / screenHeight).clamp(0.3, 0.75);
    final initialChildSize = maxChildSize;

    return Scaffold(
      body: Stack(
        children: [
          // Map
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: LatLng(
                widget.service.latitude,
                widget.service.longitude,
              ),
              initialZoom: 14.0,
              minZoom: 3.0,
              maxZoom: 18.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.medical_services',
                maxZoom: 19,
                subdomains: const ['a', 'b', 'c', 'd'],
                retinaMode: true,
                tileProvider: NetworkTileProvider(),
              ),
              // Route polyline
              if (_routePoints.isNotEmpty)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: _routePoints,
                      strokeWidth: 4,
                      color: const Color(0xFF2E7D32),
                    ),
                  ],
                ),
              // Markers
              MarkerLayer(
                markers: [
                  // Current location marker
                  Marker(
                    point: LatLng(
                      widget.currentPosition.latitude,
                      widget.currentPosition.longitude,
                    ),
                    width: 40,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Destination marker
                  Marker(
                    point: LatLng(
                      widget.service.latitude,
                      widget.service.longitude,
                    ),
                    width: 50,
                    height: 50,
                    child: const Icon(
                      Icons.location_pin,
                      size: 50,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Top bar with back button
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    _buildActionButton(
                      icon: Icons.arrow_back,
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Right side controls (zoom and location)
          Positioned(
            right: 16,
            top: 100,
            child: SafeArea(
              child: Column(
                children: [
                  _buildActionButton(
                    icon: Icons.add,
                    onTap: _zoomIn,
                  ),
                  const SizedBox(height: 8),
                  _buildActionButton(
                    icon: Icons.remove,
                    onTap: _zoomOut,
                  ),
                  const SizedBox(height: 16),
                  _buildActionButton(
                    icon: Icons.my_location,
                    onTap: _goToUserLocation,
                  ),
                  const SizedBox(height: 8),
                  _buildActionButton(
                    icon: Icons.location_searching,
                    onTap: _centerOnService,
                  ),
                ],
              ),
            ),
          ),

          // Draggable bottom sheet with service details
          DraggableScrollableSheet(
            initialChildSize: initialChildSize,
            minChildSize: minChildSize,
            maxChildSize: maxChildSize,
            snap: true,
            snapSizes: [minChildSize, maxChildSize],
            builder: (BuildContext context, ScrollController scrollController) {
              return _buildBottomSheet(scrollController);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 24),
        ),
      ),
    );
  }

  Widget _buildBottomSheet(ScrollController scrollController) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 4),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Service name and rating
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.service.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    if (widget.service.rating > 0) ...[
                                      const Icon(
                                        Icons.star,
                                        size: 18,
                                        color: Colors.amber,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        widget.service.rating.toStringAsFixed(1),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                    ],
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: widget.service.isOpen
                                            ? Colors.green.withOpacity(0.1)
                                            : Colors.red.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        widget.service.isOpen
                                            ? AppLocalizations.of(context)!.openNow
                                            : AppLocalizations.of(context)!.closed,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: widget.service.isOpen
                                              ? Colors.green[700]
                                              : Colors.red[700],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Address
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 20,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              widget.service.address,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // Distance
                      Row(
                        children: [
                          const Icon(
                            Icons.directions_car,
                            size: 20,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              AppLocalizations.of(context)!.away(widget.service.distance.toStringAsFixed(1)),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                          if (_directionsData != null) ...[
                            const SizedBox(width: 16),
                            Flexible(
                              child: Text(
                                _directionsData!['routes'][0]['legs'][0]['duration']['text'],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),

                      // Enhanced details from API
                      if (_placeDetails != null) ...[
                        const SizedBox(height: 12),

                        // Website
                        if (_placeDetails!['website'] != null)
                          Row(
                            children: [
                              const Icon(
                                Icons.language,
                                size: 20,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    final url = Uri.parse(_placeDetails!['website']);
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url, mode: LaunchMode.externalApplication);
                                    }
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)!.visitWebsite,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue[700],
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                        // Wheelchair accessible
                        if (_placeDetails!['wheelchair_accessible_entrance'] != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.accessible,
                                  size: 20,
                                  color: _placeDetails!['wheelchair_accessible_entrance']
                                      ? Colors.green
                                      : Colors.grey,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  _placeDetails!['wheelchair_accessible_entrance']
                                      ? AppLocalizations.of(context)!.wheelchairAccessible
                                      : AppLocalizations.of(context)!.limitedWheelchairAccess,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],

                      const SizedBox(height: 20),

                      // Travel mode selector (if directions shown)
                      if (_showDirections) _buildTravelModeSelector(),

                      if (_showDirections) const SizedBox(height: 16),

                      // Action buttons
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _isLoadingDirections ? null : _getDirections,
                              icon: _isLoadingDirections
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Icon(Icons.directions),
                              label: Text(
                                _showDirections
                                    ? AppLocalizations.of(context)!.updateRoute
                                    : AppLocalizations.of(context)!.getDirections,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2E7D32),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          ElevatedButton(
                            onPressed: () async {
                              try {
                                // Get phone number from place details first, fallback to service phone
                                String? phoneNumber = _placeDetails?['formatted_phone_number'] ?? 
                                                      _placeDetails?['international_phone_number'] ??
                                                      widget.service.phone;
                                
                                // Check if phone number is valid
                                if (phoneNumber == null || phoneNumber.isEmpty || phoneNumber == 'N/A') {
                                  if (mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(AppLocalizations.of(context)!.noPhoneAvailable),
                                        backgroundColor: Colors.orange,
                                      ),
                                    );
                                  }
                                  return;
                                }
                                
                                final cleanedNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
                                
                                if (cleanedNumber.isEmpty) {
                                  if (mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(AppLocalizations.of(context)!.invalidPhoneFormat),
                                        backgroundColor: Colors.orange,
                                      ),
                                    );
                                  }
                                  return;
                                }
                                
                                print('Original phone: $phoneNumber');
                                print('Cleaned phone: $cleanedNumber');
                                
                                // Use url_launcher for iOS, FlutterPhoneDirectCaller for Android
                                bool callSucceeded = false;
                                
                                // Try platform-specific approach first
                                if (Theme.of(context).platform == TargetPlatform.iOS) {
                                  // iOS: Use url_launcher
                                  final uri = Uri.parse('tel:$cleanedNumber');
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                    callSucceeded = true;
                                  } else {
                                    // On iOS simulator, tel: scheme won't work
                                    print('⚠️ Cannot launch tel: scheme (likely on simulator)');
                                    if (mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: const Text('Phone calling not available on simulator. Test on a real device.'),
                                          backgroundColor: Colors.orange,
                                        ),
                                      );
                                    }
                                  }
                                } else {
                                  // Android: Try FlutterPhoneDirectCaller first
                                  bool? result = await FlutterPhoneDirectCaller.callNumber(cleanedNumber);
                                  
                                  print('Call result: $result');
                                  
                                  if (result == true) {
                                    callSucceeded = true;
                                  } else {
                                    // Fallback to url_launcher on Android
                                    final uri = Uri.parse('tel:$cleanedNumber');
                                    if (await canLaunchUrl(uri)) {
                                      await launchUrl(uri);
                                      callSucceeded = true;
                                    } else {
                                      print('⚠️ Cannot launch tel: scheme (likely on emulator)');
                                      if (mounted) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: const Text('Phone calling not available on emulator. Test on a real device.'),
                                            backgroundColor: Colors.orange,
                                          ),
                                        );
                                      }
                                    }
                                  }
                                }
                                
                                if (!callSucceeded && mounted) {
                                  // Error already shown above for simulator/emulator cases
                                  if (mounted && Theme.of(context).platform == TargetPlatform.android) {
                                    // Only show generic error on Android if not already shown
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(AppLocalizations.of(context)!.cannotOpenPhoneDialer),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                }
                              } catch (e) {
                                print('Phone call error: $e');
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(AppLocalizations.of(context)!.cannotOpenPhoneDialer),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                              disabledBackgroundColor: Colors.grey[300],
                            ),
                            child: const Icon(Icons.phone),
                          ),
                        ],
                      ),

                      // Optional: Open in Google Maps link (if directions shown)
                      if (_showDirections) ...[
                        const SizedBox(height: 12),
                        TextButton.icon(
                          onPressed: () async {
                            final url = Uri.parse(
                              'https://www.google.com/maps/dir/?api=1&origin=${widget.currentPosition.latitude},${widget.currentPosition.longitude}&destination=${widget.service.latitude},${widget.service.longitude}&travelmode=$_selectedTravelMode'
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url, mode: LaunchMode.externalApplication);
                            } else {
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(AppLocalizations.of(context)!.errorOpeningMaps),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          },
                          icon: const Icon(Icons.open_in_new, size: 18),
                          label: Text(AppLocalizations.of(context)!.openInGoogleMaps),
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF2E7D32),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTravelModeSelector() {
    final modes = [
      {'mode': 'driving', 'icon': Icons.directions_car},
      {'mode': 'walking', 'icon': Icons.directions_walk},
      {'mode': 'bicycling', 'icon': Icons.directions_bike},
      {'mode': 'transit', 'icon': Icons.directions_transit},
    ];

    return Row(
      children: modes.map((mode) {
        final isSelected = _selectedTravelMode == mode['mode'];
        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedTravelMode = mode['mode'] as String;
              });
              _getDirections();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF2E7D32).withOpacity(0.1)
                    : Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF2E7D32)
                      : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    mode['icon'] as IconData,
                    color: isSelected
                        ? const Color(0xFF2E7D32)
                        : Colors.grey[600],
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}