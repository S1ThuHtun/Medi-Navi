class MedicalService {
  final String id;
  final String name;
  final String category;
  final double latitude;
  final double longitude;
  final String address;
  final double distance; // in km
  final String phone;
  final double rating;
  final bool isOpen;
  final String? imageUrl;

  // Enhanced fields from Place Details API
  final int? reviewCount;
  final String? website;
  final String? businessStatus;
  final bool? wheelchairAccessible;
  final int? priceLevel;
  final List<String>? openingHoursWeekday;
  final String? internationalPhone;
  final List<Map<String, dynamic>>? reviews;

  MedicalService({
    required this.id,
    required this.name,
    required this.category,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.distance,
    required this.phone,
    required this.rating,
    required this.isOpen,
    this.imageUrl,
    this.reviewCount,
    this.website,
    this.businessStatus,
    this.wheelchairAccessible,
    this.priceLevel,
    this.openingHoursWeekday,
    this.internationalPhone,
    this.reviews,
  });

  factory MedicalService.fromJson(Map<String, dynamic> json) {
    return MedicalService(
      id: json['place_id'] ?? '',
      name: json['name'] ?? '',
      category: json['types']?[0] ?? 'Medical Service',
      latitude: json['geometry']['location']['lat'] ?? 0.0,
      longitude: json['geometry']['location']['lng'] ?? 0.0,
      address: json['vicinity'] ?? json['formatted_address'] ?? '',
      distance: 0.0, // Will be calculated
      phone: json['formatted_phone_number'] ?? 'N/A',
      rating: (json['rating'] ?? 0.0).toDouble(),
      isOpen: json['opening_hours']?['open_now'] ?? false,
      imageUrl: json['photos']?[0]?['photo_reference'],
      reviewCount: json['user_ratings_total'],
      website: json['website'],
      businessStatus: json['business_status'],
      wheelchairAccessible: json['wheelchair_accessible_entrance'],
      priceLevel: json['price_level'],
      openingHoursWeekday: json['opening_hours']?['weekday_text'] != null
          ? List<String>.from(json['opening_hours']['weekday_text'])
          : null,
      internationalPhone: json['international_phone_number'],
      reviews: json['reviews'] != null
          ? List<Map<String, dynamic>>.from(json['reviews'])
          : null,
    );
  }

  // Helper method to create a copy with updated fields
  MedicalService copyWith({
    String? id,
    String? name,
    String? category,
    double? latitude,
    double? longitude,
    String? address,
    double? distance,
    String? phone,
    double? rating,
    bool? isOpen,
    String? imageUrl,
    int? reviewCount,
    String? website,
    String? businessStatus,
    bool? wheelchairAccessible,
    int? priceLevel,
    List<String>? openingHoursWeekday,
    String? internationalPhone,
    List<Map<String, dynamic>>? reviews,
  }) {
    return MedicalService(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      distance: distance ?? this.distance,
      phone: phone ?? this.phone,
      rating: rating ?? this.rating,
      isOpen: isOpen ?? this.isOpen,
      imageUrl: imageUrl ?? this.imageUrl,
      reviewCount: reviewCount ?? this.reviewCount,
      website: website ?? this.website,
      businessStatus: businessStatus ?? this.businessStatus,
      wheelchairAccessible: wheelchairAccessible ?? this.wheelchairAccessible,
      priceLevel: priceLevel ?? this.priceLevel,
      openingHoursWeekday: openingHoursWeekday ?? this.openingHoursWeekday,
      internationalPhone: internationalPhone ?? this.internationalPhone,
      reviews: reviews ?? this.reviews,
    );
  }
}