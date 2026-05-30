# MediNavi - Healthcare Map Implementation Guide

## 🎯 **Recommendation: Use Flutter Map + OSM**

For your MediNavi project focusing on healthcare services, **Flutter Map** is the best choice.

---

## **Why Flutter Map > Google Maps Flutter?**

| Feature | Flutter Map | Google Maps Flutter |
|---------|-------------|---------------------|
| **Cost** | ✅ **FREE** (unlimited) | ❌ Requires billing after quota |
| **OSM Support** | ✅ Native | ❌ Requires conversion |
| **Overpass Turbo** | ✅ Direct integration | ❌ Complex workarounds |
| **Customization** | ✅ Full control | ⚠️ Limited |
| **Offline Maps** | ✅ Supported | ❌ Limited |
| **Healthcare Focus** | ✅ Perfect fit | ⚠️ General purpose |

---

## **📦 Installation**

### **Step 1: Add Dependencies**

Add to `pubspec.yaml`:

```yaml
dependencies:
  flutter_map: ^7.0.2
  latlong2: ^0.9.0
  http: ^1.2.0
```

### **Step 2: Install**

```bash
flutter pub get
```

---

## **🗺️ Overpass Turbo Query Examples**

### **Basic Healthcare Query**

```dart
String healthcareQuery = '''
[out:json][timeout:25];
(
  node["amenity"="hospital"](around:10000,16.8661,96.1951);
  node["amenity"="clinic"](around:10000,16.8661,96.1951);
  node["amenity"="pharmacy"](around:10000,16.8661,96.1951);
  node["amenity"="doctors"](around:10000,16.8661,96.1951);
  node["amenity"="dentist"](around:10000,16.8661,96.1951);
);
out body;
''';
```

### **Advanced Query with More Details**

```dart
String detailedQuery = '''
[out:json][timeout:25];
(
  node["amenity"="hospital"](around:10000,16.8661,96.1951);
  way["amenity"="hospital"](around:10000,16.8661,96.1951);
  node["amenity"="clinic"](around:10000,16.8661,96.1951);
  node["amenity"="pharmacy"](around:10000,16.8661,96.1951);
  node["healthcare"="doctor"](around:10000,16.8661,96.1951);
  node["healthcare"="clinic"](around:10000,16.8661,96.1951);
);
out center;
>;
out skel qt;
''';
```

---

## **🏥 Healthcare Service Types from OSM**

```dart
Map<String, String> healthcareTypes = {
  'hospital': 'Hospital',
  'clinic': 'Clinic',
  'pharmacy': 'Pharmacy',
  'doctors': 'Doctor',
  'dentist': 'Dentist',
  'laboratory': 'Medical Laboratory',
  'optician': 'Optician',
  'physiotherapist': 'Physiotherapist',
};
```

---

## **📍 Custom Marker Examples**

### **Simple Markers**

```dart
Marker(
  point: LatLng(16.8661, 96.1951),
  width: 80,
  height: 80,
  child: Icon(
    Icons.local_hospital,
    color: Colors.red,
    size: 20,
  ),
)
```

### **Custom Widget Markers**

```dart
Marker(
  point: LatLng(16.8661, 96.1951),
  width: 100,
  height: 100,
  child: Column(
    children: [
      Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
            ),
          ],
        ),
        child: Icon(
          Icons.local_hospital,
          color: Colors.red,
          size: 20,
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          'Hospital',
          style: TextStyle(fontSize: 10),
        ),
      ),
    ],
  ),
)
```

---

## **🎨 Map Customization**

### **Different Tile Providers**

```dart
// Standard OSM
TileLayer(
  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
)

// Humanitarian OSM (better for healthcare)
TileLayer(
  urlTemplate: 'https://tile.openstreetmap.fr/hot/{z}/{x}/{y}.png',
)

// CartoDB (clean, minimal)
TileLayer(
  urlTemplate: 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png',
  subdomains: ['a', 'b', 'c'],
)
```

---

## **📊 API Call Example**

```dart
Future<List<HealthcareFacility>> fetchHealthcareFacilities(
  double lat,
  double lon,
  int radius,
) async {
  final query = '''
  [out:json];
  (
    node["amenity"="hospital"](around:$radius,$lat,$lon);
    node["amenity"="clinic"](around:$radius,$lat,$lon);
    node["amenity"="pharmacy"](around:$radius,$lat,$lon);
  );
  out body;
  ''';

  try {
    final response = await http.post(
      Uri.parse('https://overpass-api.de/api/interpreter'),
      body: query,
      headers: {'Content-Type': 'text/plain'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List elements = data['elements'];

      return elements.map((element) {
        return HealthcareFacility(
          name: element['tags']['name'] ?? 'Unknown',
          type: element['tags']['amenity'],
          lat: element['lat'],
          lon: element['lon'],
          address: element['tags']['addr:street'] ?? '',
          phone: element['tags']['phone'] ?? '',
        );
      }).toList();
    }
  } catch (e) {
    print('Error: $e');
  }

  return [];
}
```

---

## **🚀 Quick Start Implementation**

### **1. Replace map_screen.dart content with example**

See: `lib/screens/healthcare_map_example.dart`

### **2. Install packages**

```bash
flutter pub get
```

### **3. Test with Yangon coordinates**

Default center: `LatLng(16.8661, 96.1951)` (Yangon, Myanmar)

Change to your area in the code.

---

## **🌟 Key Features in Example**

✅ Real-time loading from Overpass API  
✅ Custom markers for different healthcare types  
✅ Click markers to view details  
✅ Filter by facility type  
✅ Zoom controls  
✅ Center on location  
✅ Facility count badge  
✅ Loading indicator  
✅ Error handling  

---

## **📝 Usage Notes**

### **Overpass API Limits**

- Rate limit: ~2 requests per minute
- Timeout: 25 seconds default
- For production, consider caching results

### **Performance Tips**

1. **Limit radius**: Start with 10km (10000m)
2. **Cache results**: Save to local database
3. **Load on demand**: Only load visible area
4. **Use clustering**: For many markers

### **Testing Overpass Queries**

Visit: https://overpass-turbo.eu/

Paste your query and click "Run" to test before implementing.

---

## **🔗 Resources**

- **Flutter Map**: https://docs.fleaflet.dev/
- **Overpass API**: https://wiki.openstreetmap.org/wiki/Overpass_API
- **Overpass Turbo**: https://overpass-turbo.eu/
- **OSM Healthcare Tags**: https://wiki.openstreetmap.org/wiki/Key:amenity#Healthcare

---

## **Next Steps for MediNavi**

1. ✅ Install packages
2. ✅ Copy example code
3. ✅ Test with Yangon data
4. Add search functionality
5. Add routing/navigation
6. Add offline map support
7. Add user location tracking
8. Add facility reviews/ratings

---

**Good luck building MediNavi! 🏥🗺️**
