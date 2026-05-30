import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import '../data/medical_services_data.dart';
import '../data/prefecture_data.dart';
import '../models/medical_service.dart';
import '../services/google_places_service.dart';
import '../utils/prefecture_localization.dart';
import '../utils/service_localization.dart';
import '../widgets/category_tabs_widget.dart';
import '../widgets/results_header_widget.dart';
import '../widgets/services_list_widget.dart';
import '../widgets/location_selector_screen_widget.dart';
import '../l10n/app_localizations.dart';
import 'chatbot_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  final GooglePlacesService _placesService = GooglePlacesService();
  List<MedicalService> _nearbyServices = [];
  bool _isLoading = false;
  Position? _currentPosition;
  String _selectedCategory = 'General Services';
  String? _selectedService = 'Internal Medicine';
  String? _selectedPrefecture;
  String? _selectedCity;
  String? _selectedWard;
  LocationData? _selectedLocation;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _initializeScreen();
  }

  Future<void> _initializeScreen() async {
    // Load saved service first
    await _loadSavedService();
    // Then get location and search
    await _getCurrentLocation();
  }

  Future<void> _loadSavedService() async {
    final prefs = await SharedPreferences.getInstance();
    final savedService = prefs.getString('selectedService');
    if (savedService != null && mounted) {
      setState(() {
        _selectedService = savedService;
      });
    }
  }

  Future<void> _saveSelectedService(String serviceName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedService', serviceName);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    if (!mounted) return;
    setState(() => _isLoading = true);

    final result = await _placesService.getCurrentLocationWithStatus();

    if (!mounted) return;

    if (result.position != null) {
      setState(() {
        _currentPosition = result.position;
        _isLoading = false;
      });

      // Auto-search for nearby services on app start using the selected service
      await _searchNearbyServices(_selectedService ?? 'Internal Medicine');
    } else {
      setState(() => _isLoading = false);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              result.error ?? AppLocalizations.of(context)!.locationError,
            ),
            backgroundColor: Colors.red,
            action: result.needsSettings
                ? SnackBarAction(
                    label: 'Settings',
                    textColor: Colors.white,
                    onPressed: () async {
                      await Geolocator.openAppSettings();
                    },
                  )
                : SnackBarAction(
                    label: 'Retry',
                    textColor: Colors.white,
                    onPressed: () {
                      _getCurrentLocation();
                    },
                  ),
            duration: const Duration(seconds: 8),
          ),
        );
      }
    }
  }

  Future<void> _searchNearbyServices(String serviceName) async {
    if (!mounted) return;

    double? searchLat;
    double? searchLng;

    // Determine search location - use most specific location selected
    if (_selectedLocation != null) {
      searchLat = _selectedLocation!.lat;
      searchLng = _selectedLocation!.lng;
    } else if (_currentPosition != null) {
      searchLat = _currentPosition!.latitude;
      searchLng = _currentPosition!.longitude;
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.selectLocationError),
            backgroundColor: Colors.orange,
          ),
        );
      }
      return;
    }

    if (!mounted) return;
    setState(() {
      _isLoading = true;
      _selectedService = serviceName;
    });

    // Save the selected service to SharedPreferences
    await _saveSelectedService(serviceName);

    final placeType = serviceToPlacesType[serviceName] ?? 'hospital';

    final services = await _placesService.searchNearbyServices(
      latitude: searchLat,
      longitude: searchLng,
      serviceType: placeType,
      radiusInMeters: 5000,
    );

    if (!mounted) return;

    // Recalculate distances from current position if a different location was selected for search
    List<MedicalService> updatedServices = services;
    if (_selectedLocation != null && _currentPosition != null) {
      updatedServices = services.map((service) {
        final distanceFromCurrentLocation = _calculateDistance(
          _currentPosition!.latitude,
          _currentPosition!.longitude,
          service.latitude,
          service.longitude,
        );
        return MedicalService(
          id: service.id,
          name: service.name,
          category: service.category,
          latitude: service.latitude,
          longitude: service.longitude,
          address: service.address,
          distance: distanceFromCurrentLocation,
          phone: service.phone,
          rating: service.rating,
          isOpen: service.isOpen,
          imageUrl: service.imageUrl,
        );
      }).toList();
    }

    // Sort by distance
    updatedServices.sort((a, b) => a.distance.compareTo(b.distance));

    if (!mounted) return;
    setState(() {
      _nearbyServices = updatedServices;
      _isLoading = false;
    });
  }

  // Calculate distance between two coordinates (Haversine formula)
  double _calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const double earthRadius = 6371; // km

    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);

    final a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) *
            cos(_toRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  double _toRadians(double degree) {
    return degree * pi / 180;
  }

  void _showLocationSelector() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LocationSelectorScreen(
          currentLocation: _selectedLocation,
          onLocationSelected: (location, prefecture, city, ward) {
            setState(() {
              _selectedLocation = location;
              _selectedPrefecture = prefecture;
              _selectedCity = city;
              _selectedWard = ward;
              _nearbyServices.clear();
              // Keep the currently selected service
            });
            // Auto-search using the currently selected service in the new location
            _searchNearbyServices(_selectedService ?? 'Internal Medicine');
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 0,
        shadowColor: Colors.black.withOpacity(0.05),
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 80,
        title: Row(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset(
                'assets/images/medinavi.png',
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.medicalServices,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: _showLocationSelector,
                    child: Row(
                      children: [
                        Icon(
                          _selectedPrefecture != null
                              ? Icons.location_city
                              : Icons.location_on,
                          size: 16,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            _getLocationDisplayText(),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/japan.png',
              color: Colors.white,
              width: 40,
              height: 40,
            ),
            onPressed: _showLocationSelector,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _getCurrentLocation,
        color: const Color(0xFF2E7D32),
        child: Column(
          children: [
            CategoryTabsWidget(
              selectedCategory: _selectedCategory,
              onCategorySelected: (category) {
                setState(() {
                  _selectedCategory = category;
                  _nearbyServices.clear();
                  _selectedService = null;
                });
              },
            ),
            // Services ListView
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 12,
                itemBuilder: (context, index) {
                  final services = [
                    'Internal Medicine',
                    'Pharmacy',
                    'Dentistry',
                    'Surgery',
                    'Orthopedics',
                    'Dermatology',
                    'Ophthalmology',
                    'ENT',
                    'Pediatrics',
                    'OG/GYN',
                    'Psychiatry',
                    'Psychosomatic Medicine',
                  ];
                  final serviceName = services[index];
                  final isSelected = _selectedService == serviceName;

                  return GestureDetector(
                    onTap: () => _searchNearbyServices(serviceName),
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF2E7D32)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          getLocalizedServiceName(
                            serviceName,
                            AppLocalizations.of(context)!,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (_nearbyServices.isNotEmpty)
              ResultsHeaderWidget(serviceCount: _nearbyServices.length),
            Expanded(
              child: ServicesListWidget(
                isLoading: _isLoading,
                nearbyServices: _nearbyServices,
                currentPosition: _currentPosition,
                selectedLocation: _selectedLocation,
                onRetry: _getCurrentLocation,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 20,
        shape: const CircleBorder(),
        onPressed: () async {
          final recommendedService = await Navigator.push<String>(
            context,
            MaterialPageRoute(builder: (context) => const ChatbotScreen()),
          );

          if (recommendedService != null && mounted) {
            // User got a department recommendation from chatbot
            setState(() {
              _selectedService = recommendedService;
            });
            await _searchNearbyServices(recommendedService);

            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    AppLocalizations.of(
                      context,
                    )!.searchingForService(recommendedService),
                  ),
                  backgroundColor: const Color(0xFF2E7D32),
                  duration: const Duration(seconds: 2),
                ),
              );
            }
          }
        },
        backgroundColor: const Color(0xFF2E7D32),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset('assets/images/medinavi.png', color: Colors.white),
        ),
      ),
    );
  }

  String _getLocationDisplayText() {
    if (_selectedWard != null) {
      final localizedWard = getLocalizedLocationName(
        _selectedWard!,
        AppLocalizations.of(context)!,
      );
      final localizedCity = getLocalizedLocationName(
        _selectedCity!,
        AppLocalizations.of(context)!,
      );
      return '$localizedWard, $localizedCity';
    } else if (_selectedCity != null) {
      final localizedCity = getLocalizedLocationName(
        _selectedCity!,
        AppLocalizations.of(context)!,
      );
      final localizedPrefecture = getLocalizedLocationName(
        _selectedPrefecture!,
        AppLocalizations.of(context)!,
      );
      return '$localizedCity, $localizedPrefecture';
    } else if (_selectedPrefecture != null) {
      return getLocalizedLocationName(
        _selectedPrefecture!,
        AppLocalizations.of(context)!,
      );
    } else if (_currentPosition != null) {
      return AppLocalizations.of(context)!.currentLocation;
    } else {
      return AppLocalizations.of(context)!.selectPrefecture;
    }
  }
}
