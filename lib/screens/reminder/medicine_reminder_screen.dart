import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../l10n/app_localizations.dart';
import '../../models/reminder.dart';
import '../../widgets/reminder_card.dart';
import '../../services/notification_service.dart';
import '../../services/background_alarm_service.dart';
import '../../services/foreground_alarm_monitor.dart';
import 'add_reminder_screen.dart';
import 'notification_screen.dart';

class MedicineReminderScreen extends StatefulWidget {
  const MedicineReminderScreen({super.key});

  @override
  State<MedicineReminderScreen> createState() => _MedicineReminderScreenState();
}

class _MedicineReminderScreenState extends State<MedicineReminderScreen> {
  List<Reminder> reminders = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadReminders();
  }

  @override
  void dispose() {
    ForegroundAlarmMonitor().stopMonitoring();
    super.dispose();
  }

  Future<void> _loadReminders() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final remindersJson = prefs.getString('reminders');

      if (remindersJson != null) {
        final List<dynamic> decodedList = json.decode(remindersJson);
        setState(() {
          reminders = decodedList
              .map((item) => Reminder.fromJson(item))
              .toList();
          _isLoading = false;
        });

        for (final reminder in reminders) {
          NotificationService().cacheReminder(reminder.id, reminder);
        }

        // Schedule all reminders as local notifications (works even when screen is locked)
        await BackgroundAlarmService().scheduleAllReminders(reminders);

        // Start foreground monitoring (auto-shows notification screen when app is open)
        ForegroundAlarmMonitor().startMonitoring(reminders);
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Save reminders to SharedPreferences
  Future<void> _saveReminders() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final remindersJson = json.encode(
        reminders.map((r) => r.toJson()).toList(),
      );
      await prefs.setString('reminders', remindersJson);
    } catch (e) {
      print('Error saving reminders: $e');
    }
  }

  void _addReminder(Reminder reminder) async {
    setState(() {
      reminders.add(reminder);
    });

    await _saveReminders();

    if (!mounted) return;
    final l10n = AppLocalizations.of(context)!;

    NotificationService().cacheReminder(reminder.id, reminder);
    await BackgroundAlarmService().scheduleAllReminders(reminders);

    ForegroundAlarmMonitor().updateReminders(reminders);
    await NotificationService().showAlarmSetConfirmation(
      medicineName: reminder.medicineName,
      time: reminder.time,
      repeatType: reminder.repeatType,
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.reminderAddedMessage,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${reminder.medicineName} at ${reminder.time}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          duration: const Duration(seconds: 4),
          backgroundColor: const Color(0xFF4CAF50),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }
  }

  void _updateReminder(Reminder updatedReminder) async {
    final index = reminders.indexWhere((r) => r.id == updatedReminder.id);
    if (index != -1) {
      setState(() {
        reminders[index] = updatedReminder;
      });

      await _saveReminders();

      NotificationService().cacheReminder(updatedReminder.id, updatedReminder);

      await BackgroundAlarmService().scheduleAllReminders(reminders);
      ForegroundAlarmMonitor().updateReminders(reminders);
      ForegroundAlarmMonitor().clearTrigger(updatedReminder.id);
      await NotificationService().showAlarmSetConfirmation(
        medicineName: updatedReminder.medicineName,
        time: updatedReminder.time,
        repeatType: updatedReminder.repeatType,
      );

      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.reminderUpdatedMessage,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${updatedReminder.medicineName} at ${updatedReminder.time}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            duration: const Duration(seconds: 4),
            backgroundColor: const Color(0xFF4CAF50),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      }
    }
  }

  void _deleteReminder(String id) async {
    final reminder = reminders.firstWhere((r) => r.id == id);

    setState(() {
      reminders.removeWhere((reminder) => reminder.id == id);
    });
    await _saveReminders();
    await NotificationService().stopAlarm();

    NotificationService().removeCachedReminder(id);

    await BackgroundAlarmService().cancelReminder(id, reminder.dosesPerDay);

    ForegroundAlarmMonitor().clearTrigger(id);

    await BackgroundAlarmService().scheduleAllReminders(reminders);

    ForegroundAlarmMonitor().updateReminders(reminders);
  }

  void _toggleReminder(String id) async {
    setState(() {
      final index = reminders.indexWhere((reminder) => reminder.id == id);
      if (index != -1) {
        reminders[index].isEnabled = !reminders[index].isEnabled;
      }
    });
    await _saveReminders();

    await BackgroundAlarmService().scheduleAllReminders(reminders);

    ForegroundAlarmMonitor().updateReminders(reminders);
  }

  void _editReminder(Reminder reminder) async {
    final updatedReminder = await Navigator.push<Reminder>(
      context,
      MaterialPageRoute(
        builder: (context) => AddReminderScreen(existingReminder: reminder),
      ),
    );
    if (updatedReminder != null) {
      _updateReminder(updatedReminder);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.medicineReminderTitle,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : reminders.isEmpty
            ? _buildEmptyState()
            : _buildReminderList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newReminder = await Navigator.push<Reminder>(
            context,
            MaterialPageRoute(builder: (context) => const AddReminderScreen()),
          );
          if (newReminder != null) {
            _addReminder(newReminder);
          }
        },
        backgroundColor: const Color(0xFF2E7D32),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 32, color: Colors.white),
      ),
    );
  }

  Widget _buildEmptyState() {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFF6B9D), Color(0xFFFF9A56)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(Icons.medication, size: 60, color: Colors.white),
          ),
          const SizedBox(height: 24),
          Text(
            l10n.reminderEmptyTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.reminderEmptySubtitle,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  // Trigger alarm for a specific reminder (for testing)
  void _triggerAlarmForReminder(Reminder reminder) {
    // Cache reminder
    NotificationService().cacheReminder(reminder.id, reminder);
    // Play alarm sound
    NotificationService().playAlarm();
    // Navigate to notification screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotificationScreen(reminder: reminder),
        fullscreenDialog: true,
      ),
    );
  }

  Widget _buildReminderList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: reminders.length,
      itemBuilder: (context, index) {
        return ReminderCard(
          reminder: reminders[index],
          onToggle: () => _toggleReminder(reminders[index].id),
          onDelete: () => _deleteReminder(reminders[index].id),
          onEdit: () => _editReminder(reminders[index]),
          onAlarm: () => _triggerAlarmForReminder(reminders[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    NotificationScreen(reminder: reminders[index]),
              ),
            );
          },
        );
      },
    );
  }
}
