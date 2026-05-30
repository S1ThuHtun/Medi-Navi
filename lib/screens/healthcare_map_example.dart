// EXAMPLE: Healthcare Facilities Map for Kobe, Japan
//
// This screen demonstrates a complete healthcare facility map using Flutter Map
// with OpenStreetMap (OSM) data via Overpass Turbo API.
//
// Features demonstrated:
// 1. Custom markers for different healthcare facilities
// 2. Real-time data from OpenStreetMap via Overpass API
// 3. Filters for different types of healthcare facilities
// 4. Custom InfoWindows when tapping markers
//
// For complete documentation, see: HEALTHCARE_MAP_GUIDE.md
//

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class HealthcareMapExample extends StatefulWidget {
  const HealthcareMapExample({super.key});

  @override
  State<HealthcareMapExample> createState() =>
      _HealthcareMapExampleState();
}

class _HealthcareMapExampleState extends State<HealthcareMapExample> {
  final MapController _mapController = MapController();
  List<HealthcareFacility> facilities = [];
  bool isLoading = false;

  // Center of Kobe, Japan
  final LatLng _center = LatLng(34.6901, 135.1955);

  // Filter states
  bool showHospitals = true;
  bool showClinics = true;
  bool showPharmacies = true;
  bool showDoctors = true;

  @override
  void initState() {
    super.initState();
    _loadHealthcareFacilities();
  }

  // Fetch healthcare facilities from Overpass API
  Future<void> _loadHealthcareFacilities() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Overpass API query
      final query =
          '''
      [out:json][timeout:25];
      (
        node["amenity"="hospital"](around:10000,${_center.latitude},${_center.longitude});
        node["amenity"="clinic"](around:10000,${_center.latitude},${_center.longitude});
        node["amenity"="pharmacy"](around:10000,${_center.latitude},${_center.longitude});
        node["amenity"="doctors"](around:10000,${_center.latitude},${_center.longitude});
        way["amenity"="hospital"](around:10000,${_center.latitude},${_center.longitude});
        way["amenity"="clinic"](around:10000,${_center.latitude},${_center.longitude});
      );
      out center;
      ''';

      final response = await http.post(
        Uri.parse('https://overpass-api.de/api/interpreter'),
        body: query,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List elements = data['elements'];

        setState(() {
          facilities = elements.map((element) {
            // Handle both nodes and ways
            double lat = element['lat'] ?? element['center']['lat'];
            double lon = element['lon'] ?? element['center']['lon'];

            return HealthcareFacility(
              name: element['tags']['name'] ?? 'Unknown Facility',
              type: element['tags']['amenity'] ?? 'healthcare',
              lat: lat,
              lon: lon,
              address: element['tags']['addr:street'] ?? '',
              phone: element['tags']['phone'] ?? '',
            );
          }).toList();
        });

        print('✅ Loaded ${facilities.length} healthcare facilities');
      }
    } catch (e) {
      print('❌ Error loading facilities: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load healthcare facilities: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Get filtered facilities based on user preferences
  List<HealthcareFacility> get filteredFacilities {
    return facilities.where((facility) {
      switch (facility.type) {
        case 'hospital':
          return showHospitals;
        case 'clinic':
          return showClinics;
        case 'pharmacy':
          return showPharmacies;
        case 'doctors':
          return showDoctors;
        default:
          return true;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Healthcare Map'),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadHealthcareFacilities,
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterDialog,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _handleLogout,
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Stack(
        children: [
          // Flutter Map
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _center,
              initialZoom: 13.0,
              minZoom: 5.0,
              maxZoom: 18.0,
            ),
            children: [
              // OpenStreetMap Tile Layer
              TileLayer(
                urlTemplate:
                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.medinavi',
              ),

              // Healthcare Markers
              MarkerLayer(
                markers: filteredFacilities.map((facility) {
                  return Marker(
                    point: LatLng(facility.lat, facility.lon),
                    width: 80,
                    height: 80,
                    child: GestureDetector(
                      onTap: () => _showFacilityInfo(facility),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Icon(
                              _getIconForType(facility.type),
                              color: _getColorForType(facility.type),
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),

          // Loading Indicator
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Loading healthcare facilities...',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

          // Facility Count Badge
          Positioned(
            top: 16,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Text(
                '${filteredFacilities.length} facilities',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Zoom In
          FloatingActionButton(
            heroTag: 'zoom_in',
            mini: true,
            onPressed: () {
              _mapController.move(
                _mapController.camera.center,
                _mapController.camera.zoom + 1,
              );
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),

          // My Location
          FloatingActionButton(
            heroTag: 'my_location',
            onPressed: () {
              _mapController.move(_center, 13.0);
            },
            child: const Icon(Icons.my_location),
          ),
          const SizedBox(height: 8),

          // Zoom Out
          FloatingActionButton(
            heroTag: 'zoom_out',
            mini: true,
            onPressed: () {
              _mapController.move(
                _mapController.camera.center,
                _mapController.camera.zoom - 1,
              );
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  // Get icon based on healthcare type
  IconData _getIconForType(String type) {
    switch (type) {
      case 'hospital':
        return Icons.local_hospital;
      case 'clinic':
        return Icons.medical_services;
      case 'pharmacy':
        return Icons.medication;
      case 'doctors':
        return Icons.person;
      default:
        return Icons.health_and_safety;
    }
  }

  // Get color based on healthcare type
  Color _getColorForType(String type) {
    switch (type) {
      case 'hospital':
        return Colors.red;
      case 'clinic':
        return Colors.blue;
      case 'pharmacy':
        return Colors.green;
      case 'doctors':
        return Colors.purple;
      default:
        return Colors.orange;
    }
  }

  // Show facility information
  void _showFacilityInfo(HealthcareFacility facility) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  _getIconForType(facility.type),
                  color: _getColorForType(facility.type),
                  size: 40,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        facility.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        facility.type.toUpperCase(),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            if (facility.address.isNotEmpty) ...[
              Row(
                children: [
                  const Icon(Icons.location_on, size: 20),
                  const SizedBox(width: 8),
                  Expanded(child: Text(facility.address)),
                ],
              ),
              const SizedBox(height: 8),
            ],
            if (facility.phone.isNotEmpty) ...[
              Row(
                children: [
                  const Icon(Icons.phone, size: 20),
                  const SizedBox(width: 8),
                  Text(facility.phone),
                ],
              ),
              const SizedBox(height: 8),
            ],
            Row(
              children: [
                const Icon(Icons.map, size: 20),
                const SizedBox(width: 8),
                Text(
                  '${facility.lat.toStringAsFixed(4)}, ${facility.lon.toStringAsFixed(4)}',
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                    label: const Text('Close'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      _mapController.move(
                        LatLng(facility.lat, facility.lon),
                        16.0,
                      );
                    },
                    icon: const Icon(Icons.navigation),
                    label: const Text('Navigate'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Show filter dialog
  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Filter Healthcare Services'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CheckboxListTile(
                title: const Text('🏥 Hospitals'),
                value: showHospitals,
                onChanged: (value) {
                  setDialogState(() => showHospitals = value ?? true);
                  setState(() => showHospitals = value ?? true);
                },
              ),
              CheckboxListTile(
                title: const Text('🩺 Clinics'),
                value: showClinics,
                onChanged: (value) {
                  setDialogState(() => showClinics = value ?? true);
                  setState(() => showClinics = value ?? true);
                },
              ),
              CheckboxListTile(
                title: const Text('💊 Pharmacies'),
                value: showPharmacies,
                onChanged: (value) {
                  setDialogState(() => showPharmacies = value ?? true);
                  setState(() => showPharmacies = value ?? true);
                },
              ),
              CheckboxListTile(
                title: const Text('👨‍⚕️ Doctors'),
                value: showDoctors,
                onChanged: (value) {
                  setDialogState(() => showDoctors = value ?? true);
                  setState(() => showDoctors = value ?? true);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }

  // Handle logout
  Future<void> _handleLogout() async {
    // Show confirmation dialog
    final bool? shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );

    // If user confirmed logout
    if (shouldLogout == true) {
      try {
        await FirebaseAuth.instance.signOut();
        print('✅ User logged out successfully');

        // Show success message
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Logged out successfully'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        }
      } catch (e) {
        print('❌ Error during logout: $e');

        // Show error message
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error logging out: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
}

// Model class for healthcare facilities
class HealthcareFacility {
  final String name;
  final String type;
  final double lat;
  final double lon;
  final String address;
  final String phone;

  HealthcareFacility({
    required this.name,
    required this.type,
    required this.lat,
    required this.lon,
    this.address = '',
    this.phone = '',
  });
}
