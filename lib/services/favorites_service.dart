import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/medical_service.dart';

class FavoritesService {
  static const String _favoritesKey = 'user_favorites';

  // Get all favorites
  static Future<List<MedicalService>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getStringList(_favoritesKey) ?? [];

    print('📖 Loading favorites: ${favoritesJson.length} items');

    return favoritesJson.map((jsonString) {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return MedicalService.fromJson(json);
    }).toList();
  }

  // Check if a service is favorited
  static Future<bool> isFavorite(String serviceId) async {
    final favorites = await getFavorites();
    return favorites.any((service) => service.id == serviceId);
  }

  // Add to favorites
  static Future<void> addFavorite(MedicalService service) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();

    // Check if already exists
    if (!favorites.any((s) => s.id == service.id)) {
      favorites.add(service);
      final favoritesJson = favorites
          .map((s) => jsonEncode(_serviceToJson(s)))
          .toList();
      await prefs.setStringList(_favoritesKey, favoritesJson);
      print('✅ Favorite added: ${service.name} (ID: ${service.id})');
      print('📊 Total favorites: ${favorites.length}');
    } else {
      print('⚠️ Service already in favorites: ${service.name}');
    }
  }

  // Remove from favorites
  static Future<void> removeFavorite(String serviceId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();

    favorites.removeWhere((service) => service.id == serviceId);
    final favoritesJson = favorites
        .map((s) => jsonEncode(_serviceToJson(s)))
        .toList();
    await prefs.setStringList(_favoritesKey, favoritesJson);
  }

  // Toggle favorite status
  static Future<bool> toggleFavorite(MedicalService service) async {
    final isFav = await isFavorite(service.id);
    if (isFav) {
      await removeFavorite(service.id);
      return false;
    } else {
      await addFavorite(service);
      return true;
    }
  }

  // Convert MedicalService to JSON
  static Map<String, dynamic> _serviceToJson(MedicalService service) {
    return {
      'place_id': service.id,
      'name': service.name,
      'types': [service.category],
      'geometry': {
        'location': {'lat': service.latitude, 'lng': service.longitude},
      },
      'vicinity': service.address,
      'formatted_address': service.address,
      'formatted_phone_number': service.phone,
      'rating': service.rating,
      'distance': service.distance, // Save distance
      'opening_hours': {
        'open_now': service.isOpen,
        'weekday_text': service.openingHoursWeekday,
      },
      'photos': service.imageUrl != null
          ? [
              {'photo_reference': service.imageUrl},
            ]
          : null,
      'user_ratings_total': service.reviewCount,
      'website': service.website,
      'business_status': service.businessStatus,
      'wheelchair_accessible_entrance': service.wheelchairAccessible,
      'price_level': service.priceLevel,
      'international_phone_number': service.internationalPhone,
      'reviews': service.reviews,
    };
  }
}
