# Quick Setup Instructions

## Install Flutter Map Packages

Run this command in your terminal:

```bash
cd "/Users/sithuhtun/Udemy Courses/Flutter Projects/flutter_projects/medinavi"
flutter pub add flutter_map latlong2 http
```

This will automatically add to pubspec.yaml:
- flutter_map (for the map)
- latlong2 (for coordinates)
- http (for Overpass API calls)

## After Installation

1. Check `lib/screens/healthcare_map_example.dart` for full example
2. Read `HEALTHCARE_MAP_GUIDE.md` for documentation
3. Replace your map_screen.dart with the example code

## Quick Test

After installing, you can import the example in main.dart:

```dart
import 'package:medinavi/screens/healthcare_map_example.dart';

// In StreamBuilder, replace MapScreen() with:
return const HealthcareMapExample();
```

Then run the app to see the healthcare map in action!
