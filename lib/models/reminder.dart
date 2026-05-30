class Reminder {
  final String id;
  final String medicineName;
  final String time;
  final String
  repeatType; // 'never', 'everyday', 'weekdays', 'weekends', 'custom'
  final List<int>? customDays; // 0=Monday, 1=Tuesday, ..., 6=Sunday
  final String? photoPath; // Path to medicine photo
  final String mealTiming; // 'none', 'before' (食前), 'after' (食後)
  final int dosesPerDay; // Number of times per day: 1, 2, 3, or 4
  final List<String>
  doseTimes; // Times for each dose: ['08:00', '12:00', '18:00']
  List<bool>
  takenToday; // Track if each dose is taken today: [true, false, false]
  bool isEnabled; // Whether reminder is active

  Reminder({
    required this.id,
    required this.medicineName,
    required this.time,
    this.repeatType = 'never',
    this.customDays,
    this.photoPath,
    this.mealTiming = 'none',
    this.dosesPerDay = 1,
    List<String>? doseTimes,
    List<bool>? takenToday,
    this.isEnabled = true,
  }) : doseTimes = doseTimes ?? [time],
       takenToday = takenToday ?? List.filled(dosesPerDay, false);

  // Get localized repeat text in Japanese
  String getRepeatText() {
    switch (repeatType) {
      case 'everyday':
        return '毎日'; // Every day
      case 'weekdays':
        return '平日のみ'; // Weekdays only
      case 'weekends':
        return '週末のみ'; // Weekends only
      case 'custom':
        if (customDays == null || customDays!.isEmpty) {
          return '繰り返しなし';
        }
        final dayNames = ['月', '火', '水', '木', '金', '土', '日']; // Mon-Sun
        final days = customDays!.map((i) => dayNames[i]).join('、');
        return '毎週 $days'; // Every week Mon, Wed, Fri
      case 'never':
      default:
        return '繰り返しなし'; // No repeat
    }
  }

  // Get localized meal timing text
  String getMealTimingText() {
    switch (mealTiming) {
      case 'before':
        return '食前'; // Before meals
      case 'after':
        return '食後'; // After meals
      default:
        return '';
    }
  }

  // Check if medicine should be taken after meals
  bool get isAfterMeal => mealTiming == 'after';

  // Check if medicine should be taken before meals
  bool get isBeforeMeal => mealTiming == 'before';

  // Get number of doses taken today
  int get takenCount => takenToday.where((taken) => taken).length;

  // Get completion text like "2/3"
  String get completionText => '$takenCount/$dosesPerDay';

  // Get completion percentage (0.0 to 1.0)
  double get completionPercentage => takenCount / dosesPerDay;

  // Convert reminder to JSON for persistence
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'medicineName': medicineName,
      'time': time,
      'repeatType': repeatType,
      'customDays': customDays,
      'photoPath': photoPath,
      'mealTiming': mealTiming,
      'dosesPerDay': dosesPerDay,
      'doseTimes': doseTimes,
      'takenToday': takenToday,
      'isEnabled': isEnabled,
    };
  }

  // Create reminder from JSON
  factory Reminder.fromJson(Map<String, dynamic> json) {
    return Reminder(
      id: json['id'] as String,
      medicineName: json['medicineName'] as String,
      time: json['time'] as String,
      repeatType: json['repeatType'] as String? ?? 'never',
      customDays: (json['customDays'] as List<dynamic>?)?.cast<int>(),
      photoPath: json['photoPath'] as String?,
      mealTiming: json['mealTiming'] as String? ?? 'none',
      dosesPerDay: json['dosesPerDay'] as int? ?? 1,
      doseTimes:
          (json['doseTimes'] as List<dynamic>?)?.cast<String>() ??
          [json['time'] as String],
      takenToday: (json['takenToday'] as List<dynamic>?)?.cast<bool>(),
      isEnabled: json['isEnabled'] as bool? ?? true,
    );
  }

  // Get dose label for a specific dose index
  // Examples: 朝 (morning), 昼 (noon), 夕 (evening), 夜 (night)
  String getDoseLabel(int index) {
    if (dosesPerDay == 1) {
      return ''; // Single dose, no label needed
    }
    if (dosesPerDay == 2) {
      return index == 0 ? '朝' : '夜'; // Morning / Night
    }
    if (dosesPerDay == 3) {
      return ['朝', '昼', '夜'][index]; // Morning / Noon / Night
    }
    if (dosesPerDay == 4) {
      return ['朝', '昼', '夕', '夜'][index]; // Morning / Noon / Evening / Night
    }
    return '${index + 1}回目'; // Nth time
  }
}
