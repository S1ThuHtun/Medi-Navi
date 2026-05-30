import '../models/reminder.dart';
import 'notification_service.dart';

/// Service to handle alarms in background when app is not active
/// This works with iOS local notifications which fire even when app is closed
class BackgroundAlarmService {
  static final BackgroundAlarmService _instance = BackgroundAlarmService._();
  factory BackgroundAlarmService() => _instance;
  BackgroundAlarmService._();

  /// Schedule all reminder notifications
  /// These will trigger even when the app is in background or screen is locked
  Future<void> scheduleAllReminders(List<Reminder> reminders) async {
    for (final reminder in reminders) {
      if (reminder.isEnabled) {
        await _scheduleReminderNotifications(reminder);
      }
    }
  }

  Future<void> _scheduleReminderNotifications(Reminder reminder) async {
    // Cancel existing notifications for this reminder
    await NotificationService().cancelReminderNotifications(
      reminder.id,
      reminder.dosesPerDay,
    );

    // Cache reminder for when notification is tapped
    NotificationService().cacheReminder(reminder.id, reminder);

    // Schedule new notifications for each dose
    for (int i = 0; i < reminder.doseTimes.length; i++) {
      final time = reminder.doseTimes[i];
      final parts = time.split(':');
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);

      final notificationId = '${reminder.id}_$i'.hashCode;
      final payload = '${reminder.id}|$i';

      switch (reminder.repeatType) {
        case 'everyday':
          // Repeats every day at the same time
          await NotificationService().scheduleDailyNotification(
            id: notificationId,
            title: '💊 ${reminder.medicineName}',
            body: 'Time to take your medicine!',
            hour: hour,
            minute: minute,
            payload: payload,
            channelName: 'Medicine Reminder',
            channelDescription: 'Reminds you to take your medicine',
          );
          break;

        case 'weekdays':
          // Repeats Monday through Friday (weekdays 1-5)
          await _scheduleWeeklyNotifications(
            notificationId: notificationId,
            title: '💊 ${reminder.medicineName}',
            body: 'Time to take your medicine!',
            hour: hour,
            minute: minute,
            payload: payload,
            daysOfWeek: [1, 2, 3, 4, 5], // Mon-Fri
          );
          break;

        case 'weekends':
          // Repeats Saturday and Sunday (weekends 6-7)
          await _scheduleWeeklyNotifications(
            notificationId: notificationId,
            title: '💊 ${reminder.medicineName}',
            body: 'Time to take your medicine!',
            hour: hour,
            minute: minute,
            payload: payload,
            daysOfWeek: [6, 7], // Sat-Sun
          );
          break;

        case 'custom':
          // Repeats on custom selected days
          if (reminder.customDays != null && reminder.customDays!.isNotEmpty) {
            // customDays uses 0=Monday, 1=Tuesday, ..., 6=Sunday
            // Convert to DateTime weekday format: 1=Monday, 2=Tuesday, ..., 7=Sunday
            final daysOfWeek = reminder.customDays!
                .map((day) => day + 1)
                .toList();
            await _scheduleWeeklyNotifications(
              notificationId: notificationId,
              title: '💊 ${reminder.medicineName}',
              body: 'Time to take your medicine!',
              hour: hour,
              minute: minute,
              payload: payload,
              daysOfWeek: daysOfWeek,
            );
          }
          break;

        case 'never':
        default:
          // One-time notification - schedule for next occurrence only
          final now = DateTime.now();
          var scheduledTime = DateTime(
            now.year,
            now.month,
            now.day,
            hour,
            minute,
          );

          if (scheduledTime.isBefore(now)) {
            scheduledTime = scheduledTime.add(const Duration(days: 1));
          }

          await NotificationService().scheduleNotification(
            id: notificationId,
            title: '💊 ${reminder.medicineName}',
            body: 'Time to take your medicine!',
            scheduledTime: scheduledTime,
            payload: payload,
            channelName: 'Medicine Reminder',
            channelDescription: 'Reminds you to take your medicine',
          );
          break;
      }
    }
  }

  /// Schedule weekly notifications for specific days of the week
  Future<void> _scheduleWeeklyNotifications({
    required int notificationId,
    required String title,
    required String body,
    required int hour,
    required int minute,
    required String payload,
    required List<int> daysOfWeek,
  }) async {
    final now = DateTime.now();

    // Schedule notifications for each specified day of the week
    for (int i = 0; i < 7; i++) {
      final targetDay = now.add(Duration(days: i));

      // Check if this day is in the list of days to schedule
      if (daysOfWeek.contains(targetDay.weekday)) {
        var scheduledTime = DateTime(
          targetDay.year,
          targetDay.month,
          targetDay.day,
          hour,
          minute,
        );

        // If the time has already passed today, schedule for next week
        if (scheduledTime.isBefore(now)) {
          scheduledTime = scheduledTime.add(const Duration(days: 7));
        }

        // Use unique ID for each day of the week
        final uniqueId = notificationId + targetDay.weekday;

        await NotificationService().scheduleNotification(
          id: uniqueId,
          title: title,
          body: body,
          scheduledTime: scheduledTime,
          payload: payload,
          channelName: 'Medicine Reminder',
          channelDescription: 'Reminds you to take your medicine',
        );
      }
    }
  }

  /// Cancel all notifications for a reminder
  Future<void> cancelReminder(String reminderId, int dosesCount) async {
    await NotificationService().cancelReminderNotifications(
      reminderId,
      dosesCount,
    );
  }
}
