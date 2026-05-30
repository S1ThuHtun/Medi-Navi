import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../screens/reminder/notification_screen.dart';
import '../models/reminder.dart';

// Top-level function for background notification handling
// This is required by iOS for notifications when app is terminated
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse response) {
  // Background tap - just log it, navigation happens when app opens
}

class NotificationService {
  static final NotificationService _instance = NotificationService._();
  factory NotificationService() => _instance;
  NotificationService._();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();
  bool _initialized = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Store reminders for navigation
  final Map<String, Reminder> _reminderCache = {};

  Future<void> initialize() async {
    if (_initialized) return;

    tzdata.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Tokyo'));

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );

    _setupForegroundNotificationHandler();

    _initialized = true;
  }

  void _setupForegroundNotificationHandler() {
    print('✅ Foreground notification handler setup complete');
    print(
      '⚠️ Note: On iOS/Android, user must tap notification to open app when screen is locked',
    );
  }

  void _onNotificationTap(NotificationResponse response) {
    if (response.payload != null) {
      final parts = response.payload!.split('|');
      if (parts.isNotEmpty) {
        final reminderId = parts[0];
        final reminder = _reminderCache[reminderId];

        if (reminder != null) {
          // Play alarm sound
          playAlarm();

          // Navigate to notification screen
          Future.delayed(Duration.zero, () {
            navigatorKey.currentState?.push(
              MaterialPageRoute(
                builder: (context) => NotificationScreen(reminder: reminder),
                fullscreenDialog: true,
              ),
            );
          });
        } else {
          print('Reminder not found in cache for ID: $reminderId');
        }
      }
    }
  }

  Future<void> playAlarm() async {
    try {
      // Set audio player to loop continuously for persistent alarm
      await _audioPlayer.setReleaseMode(ReleaseMode.loop);
      await _audioPlayer.setVolume(1.0);

      // Try to play custom alarm sound from assets
      try {
        await _audioPlayer.play(AssetSource('sounds/alarm.mp3'));
      } catch (assetError) {
        // Fallback: Try to play a simple tone from a free online source
        // This URL provides a simple notification beep sound
        try {
          await _audioPlayer.play(
            UrlSource(
              'https://actions.google.com/sounds/v1/alarms/beep_short.ogg',
            ),
          );
        } catch (urlError) {
          print(
            'Could not play alarm sound. Asset error: $assetError, URL error: $urlError',
          );
        }
      }
    } catch (e) {
      print('Error playing alarm: $e');
    }
  }

  Future<void> stopAlarm() async {
    await _audioPlayer.stop();
  }

  void cacheReminder(String reminderId, Reminder reminder) {
    _reminderCache[reminderId] = reminder;
  }

  void removeCachedReminder(String reminderId) {
    _reminderCache.remove(reminderId);
  }

  Future<bool> requestPermissions() async {
    final android = _notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    if (android != null) {
      final granted = await android.requestNotificationsPermission();
      return granted ?? false;
    }

    final iOS = _notifications
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >();

    if (iOS != null) {
      final granted = await iOS.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      return granted ?? false;
    }

    return true;
  }

  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
    String? payload,
    String channelName = 'Medicine Reminder',
    String channelDescription = 'Reminds you to take your medicine',
  }) async {
    await _notifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledTime, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          'pill_reminder_channel',
          channelName,
          channelDescription: channelDescription,
          importance: Importance.max,
          priority: Priority.max,
          showWhen: true,
          autoCancel: false,
          ongoing: true,
          fullScreenIntent: true,
          playSound: true,
          enableVibration: true,
          channelShowBadge: true,
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
          sound: 'default',
          interruptionLevel: InterruptionLevel.timeSensitive,
        ),
      ),
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> scheduleDailyNotification({
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minute,
    String? payload,
    String channelName = 'Medicine Reminder',
    String channelDescription = 'Reminds you to take your medicine',
  }) async {
    await _notifications.zonedSchedule(
      id,
      title,
      body,
      _nextInstanceOfTime(hour, minute),
      NotificationDetails(
        android: AndroidNotificationDetails(
          'pill_reminder_channel',
          channelName,
          channelDescription: channelDescription,
          importance: Importance.max,
          priority: Priority.max,
          showWhen: true,
          autoCancel: false,
          ongoing: true,
          fullScreenIntent: true,
          playSound: true,
          enableVibration: true,
          channelShowBadge: true,
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
          sound: 'default',
          interruptionLevel: InterruptionLevel.timeSensitive,
        ),
      ),
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.wallClockTime,
    );
  }

  tz.TZDateTime _nextInstanceOfTime(int hour, int minute) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    return scheduledDate;
  }

  Future<void> scheduleReminderDoses({
    required String reminderId,
    required String medicineName,
    required List<String> doseTimes,
    required String repeatType,
    required String notificationChannelName,
    required String notificationChannelDescription,
    required List<String> doseLabels,
    required List<String> notificationBodies,
  }) async {
    for (int i = 0; i < doseTimes.length; i++) {
      final time = doseTimes[i];
      final parts = time.split(':');
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);

      final notificationId = '${reminderId}_$i'.hashCode;
      final doseLabel = i < doseLabels.length ? doseLabels[i] : '';

      final title = doseLabel.isNotEmpty
          ? '$medicineName ($doseLabel)'
          : medicineName;
      final body = i < notificationBodies.length ? notificationBodies[i] : '';

      if (repeatType == 'everyday') {
        await scheduleDailyNotification(
          id: notificationId,
          title: title,
          body: body,
          hour: hour,
          minute: minute,
          payload: '$reminderId|$i',
          channelName: notificationChannelName,
          channelDescription: notificationChannelDescription,
        );
      } else {
        final scheduledTime = _nextInstanceOfTime(hour, minute).toLocal();
        await scheduleNotification(
          id: notificationId,
          title: title,
          body: body,
          scheduledTime: scheduledTime,
          payload: '$reminderId|$i',
          channelName: notificationChannelName,
          channelDescription: notificationChannelDescription,
        );
      }
    }
  }

  Future<void> cancelDoseNotification(String reminderId, int doseIndex) async {
    final notificationId = '${reminderId}_$doseIndex'.hashCode;
    await _notifications.cancel(notificationId);
  }

  Future<void> cancelReminderNotifications(
    String reminderId,
    int dosesCount,
  ) async {
    for (int i = 0; i < dosesCount; i++) {
      await cancelDoseNotification(reminderId, i);
    }
  }

  Future<void> cancelAll() async {
    await _notifications.cancelAll();
  }

  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    return await _notifications.pendingNotificationRequests();
  }

  // Show immediate notification for testing
  Future<void> showImmediateNotification({
    required String reminderId,
    required String title,
    required String body,
  }) async {
    await _notifications.show(
      reminderId.hashCode,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          'pill_reminder_channel',
          'Medicine Reminder',
          channelDescription: 'Reminds you to take your medicine',
          importance: Importance.max,
          priority: Priority.max,
          showWhen: true,
          autoCancel: false,
          ongoing: true,
          fullScreenIntent: true,
          playSound: true,
          enableVibration: true,
          channelShowBadge: true,
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
          interruptionLevel: InterruptionLevel.timeSensitive,
        ),
      ),
      payload: '$reminderId|0',
    );
  }

  // Show alarm set confirmation notification
  Future<void> showAlarmSetConfirmation({
    required String medicineName,
    required String time,
    required String repeatType,
  }) async {
    String repeatText = '';
    switch (repeatType) {
      case 'everyday':
        repeatText = 'Every day';
        break;
      case 'weekdays':
        repeatText = 'Weekdays';
        break;
      case 'weekends':
        repeatText = 'Weekends';
        break;
      case 'custom':
        repeatText = 'Custom days';
        break;
      case 'never':
        repeatText = 'One time';
        break;
    }

    await _notifications.show(
      DateTime.now().millisecondsSinceEpoch % 100000, // Unique ID
      'Reminder Set',
      '$medicineName - $time ($repeatText)',
      NotificationDetails(
        android: AndroidNotificationDetails(
          'reminder_confirmation_channel',
          'Reminder Confirmation',
          channelDescription: 'Confirms when a reminder is set',
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
          showWhen: true,
          autoCancel: true,
          playSound: true,
          enableVibration: false,
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: false,
          presentSound: true,
        ),
      ),
    );
  }
}
