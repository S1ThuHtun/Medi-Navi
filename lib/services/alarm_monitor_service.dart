import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/reminder.dart';
import '../main.dart';
import '../screens/reminder/notification_screen.dart';
import 'notification_service.dart';

class AlarmMonitorService {
  static final AlarmMonitorService _instance = AlarmMonitorService._();
  factory AlarmMonitorService() => _instance;
  AlarmMonitorService._();

  Timer? _monitorTimer;
  final List<Reminder> _activeReminders = [];
  final Set<String> _triggeredToday =
      {}; // Track which reminders triggered today
  final Set<String> _triggeredEver =
      {}; // Track which "never" mode reminders triggered (permanent)

  Future<void> startMonitoring(List<Reminder> reminders) async {
    _activeReminders.clear();
    _activeReminders.addAll(reminders.where((r) => r.isEnabled));

    // Load permanently triggered reminders from storage
    await _loadTriggeredEver();

    // Check every second for matching times
    _monitorTimer?.cancel();
    _monitorTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _checkReminders();
    });
  }

  // Load the list of reminders that have been triggered (for 'never' mode)
  Future<void> _loadTriggeredEver() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final triggeredList = prefs.getStringList('triggeredEver') ?? [];
      _triggeredEver.clear();
      _triggeredEver.addAll(triggeredList);
    } catch (e) {
      print('Error loading triggered reminders: $e');
    }
  }

  // Save the list of reminders that have been triggered (for 'never' mode)
  Future<void> _saveTriggeredEver() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('triggeredEver', _triggeredEver.toList());
    } catch (e) {
      print('Error saving triggered reminders: $e');
    }
  }

  void stopMonitoring() {
    _monitorTimer?.cancel();
    _monitorTimer = null;
  }

  void updateReminders(List<Reminder> reminders) {
    _activeReminders.clear();
    _activeReminders.addAll(reminders.where((r) => r.isEnabled));
  }

  // Clear permanent trigger for a specific reminder (useful when editing/deleting)
  Future<void> clearPermanentTrigger(String reminderId) async {
    _triggeredEver.removeWhere((id) => id.startsWith(reminderId));
    await _saveTriggeredEver();
  }

  void _checkReminders() {
    final now = DateTime.now();
    final currentTime =
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';

    // Debug: Print every minute to confirm monitoring is active
    // if (now.second == 0) {
    //   if (_activeReminders.isNotEmpty) {
    //     for (final reminder in _activeReminders) {
    //       print('   - ${reminder.medicineName}: times=${reminder.doseTimes}, enabled=${reminder.isEnabled}');
    //     }
    //   }
    // }

    // Reset triggered list at midnight
    if (now.hour == 0 && now.minute == 0) {
      _triggeredToday.clear();
    }

    for (final reminder in _activeReminders) {
      for (int i = 0; i < reminder.doseTimes.length; i++) {
        final doseTime = reminder.doseTimes[i];
        final triggerId = '${reminder.id}_${doseTime}_${now.day}';
        final permanentTriggerId =
            '${reminder.id}_$doseTime'; // For 'never' mode (no day)

        // For 'never' mode, check if it's been triggered ever
        if (reminder.repeatType == 'never' &&
            _triggeredEver.contains(permanentTriggerId)) {
          // Already triggered once, skip forever
          continue;
        }

        // Check if this dose time matches current time and hasn't been triggered yet today
        if (doseTime == currentTime && !_triggeredToday.contains(triggerId)) {
          // Check if reminder should trigger today based on repeat type
          if (_shouldTriggerToday(reminder, now)) {
            _triggeredToday.add(triggerId);

            // For 'never' mode, save it permanently so it never triggers again
            if (reminder.repeatType == 'never') {
              _triggeredEver.add(permanentTriggerId);
              _saveTriggeredEver();
            }

            _triggerAlarm(reminder);
          } else {
            print(
              'Skipped (not scheduled for today): ${reminder.medicineName}',
            );
          }
        }
      }
    }
  }

  bool _shouldTriggerToday(Reminder reminder, DateTime now) {
    switch (reminder.repeatType) {
      case 'everyday':
        return true;
      case 'weekdays':
        // Monday = 1, Friday = 5
        return now.weekday >= 1 && now.weekday <= 5;
      case 'weekends':
        // Saturday = 6, Sunday = 7
        return now.weekday == 6 || now.weekday == 7;
      case 'custom':
        if (reminder.customDays != null) {
          // customDays: 0=Monday, 6=Sunday
          // DateTime.weekday: 1=Monday, 7=Sunday
          final todayIndex = now.weekday - 1; // Convert to 0-based
          return reminder.customDays!.contains(todayIndex);
        }
        return false;
      case 'never':
      default:
        // 'never' means trigger once - it will only trigger once per day
        // because we use _triggeredToday to prevent duplicate triggers
        return true;
    }
  }

  void _triggerAlarm(Reminder reminder) {
    // Cache reminder for notification service
    NotificationService().cacheReminder(reminder.id, reminder);

    // Play alarm sound
    NotificationService().playAlarm();

    if (navigatorKey.currentContext != null) {
      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) {
            return NotificationScreen(reminder: reminder);
          },
          fullscreenDialog: true,
        ),
      );
    } else {
      print('Cannot navigate: navigatorKey.currentContext is null');
    }
  }

  void dispose() {
    stopMonitoring();
  }
}
