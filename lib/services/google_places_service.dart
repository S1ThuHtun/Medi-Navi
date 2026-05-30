import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/medical_service.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math';

class GooglePlacesService {
  static String get apiKey => dotenv.env['GOOGLE_PLACES_API_KEY'] ?? '';
  static const String baseUrl = 'https://maps.googleapis.com/maps/api/place';

  // Search for nearby medical services
  Future<List<MedicalService>> searchNearbyServices({
    required double latitude,
    required double longitude,
    required String serviceType,
    double radiusInMeters = 5000, // 5km default
  }) async {
    try {
      final url = Uri.parse(
        '$baseUrl/nearbysearch/json?location=$latitude,$longitude&radius=$radiusInMeters&type=$serviceType&key=$apiKey',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == 'OK') {
          final List results = data['results'];

          return results.map((place) {
            final service = MedicalService.fromJson(place);
            final distance = _calculateDistance(
              latitude,
              longitude,
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
              distance: distance,
              phone: service.phone,
              rating: service.rating,
              isOpen: service.isOpen,
              imageUrl: service.imageUrl,
            );
          }).toList();
        }
      }

      return [];
    } catch (e) {
      return [];
    }
  }

  // Get place details with comprehensive data
  Future<Map<String, dynamic>?> getPlaceDetails(String placeId) async {
    try {
      final url = Uri.parse(
        '$baseUrl/details/json?place_id=$placeId&fields='
        'name,formatted_address,formatted_phone_number,international_phone_number,'
        'geometry,rating,user_ratings_total,price_level,'
        'opening_hours,current_opening_hours,photos,website,url,'
        'reviews,types,vicinity,business_status,wheelchair_accessible_entrance'
        '&key=$apiKey',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == 'OK') {
          final result = data['result'];
          print('Retrieved details:');
          print('   - Name: ${result['name']}');
          print('   - Phone: ${result['formatted_phone_number'] ?? 'N/A'}');
          print('   - Rating: ${result['rating'] ?? 'N/A'}');
          print('   - Reviews: ${result['user_ratings_total'] ?? 0}');
          print('   - Website: ${result['website'] ?? 'N/A'}');
          print(
            '   - Wheelchair accessible: ${result['wheelchair_accessible_entrance'] ?? 'Unknown'}',
          );
          return result;
        } else {
          print('Place details error: ${data['status']}');
        }
      }

      return null;
    } catch (e) {
      print('Error fetching place details: $e');
      return null;
    }
  }

  // Get directions between two points
  Future<Map<String, dynamic>?> getDirections({
    required double startLat,
    required double startLng,
    required double endLat,
    required double endLng,
    String mode = 'driving', // driving, walking, bicycling, transit
  }) async {
    try {
      final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/directions/json?origin=$startLat,$startLng&destination=$endLat,$endLng&mode=$mode&key=$apiKey',
      );

      print('🗺️ Fetching directions with mode: $mode');
      print('URL: $url');

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        print('Response status: ${data['status']}');

        if (data['status'] == 'OK') {
          print('Routes found: ${data['routes']?.length ?? 0}');
          return data;
        } else {
          // Return the data even on error so we can show proper error messages
          print('API Error: ${data['status']}');
          if (data['error_message'] != null) {
            print('Error message: ${data['error_message']}');
          }
          return data; // Return data with error status
        }
      }

      print('HTTP Error: ${response.statusCode}');
      return null;
    } catch (e) {
      print('Exception fetching directions: $e');
      return null;
    }
  }

  // Get current location with detailed error information
  Future<({Position? position, String? error, bool needsSettings})>
  getCurrentLocationWithStatus() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return (
          position: null,
          error:
              'Location services are disabled. Please enable location in your device settings.',
          needsSettings: true,
        );
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return (
            position: null,
            error:
                'Location permission was denied. Please grant location permission to find nearby services.',
            needsSettings: false,
          );
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return (
          position: null,
          error:
              'Location permission permanently denied. Please enable it in app settings.',
          needsSettings: true,
        );
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 15),
      );
      return (position: position, error: null, needsSettings: false);
    } catch (e) {
      String errorMessage = 'Unable to get your location. ';

      if (e.toString().contains('timeout')) {
        errorMessage +=
            'Location request timed out. Please check if location services are working properly.';
      } else if (e.toString().contains('PERMISSION')) {
        errorMessage +=
            'Location permission issue. Please check app permissions.';
      } else {
        errorMessage += 'Error: ${e.toString()}';
      }

      return (position: null, error: errorMessage, needsSettings: true);
    }
  }

  // Get current location (legacy method for backward compatibility)
  Future<Position?> getCurrentLocation() async {
    final result = await getCurrentLocationWithStatus();
    return result.position;
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

  // Get photo URL
  String getPhotoUrl(String photoReference, {int maxWidth = 400}) {
    return '$baseUrl/photo?maxwidth=$maxWidth&photo_reference=$photoReference&key=$apiKey';
  }
}
