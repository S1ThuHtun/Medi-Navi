import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:medinavi/l10n/app_localizations.dart';
import 'package:medinavi/services/background_alarm_service.dart';
import 'package:medinavi/services/foreground_alarm_monitor.dart';
import 'package:medinavi/services/notification_service.dart';
import 'package:medinavi/models/reminder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';
import 'favorites_screen.dart';
import 'settings_screen.dart';
import 'reminder/medicine_reminder_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  int _favoritesRefreshKey = 0;

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _updateScreens();
    _initializeAlarmMonitor();
  }

  Future<void> _initializeAlarmMonitor() async {
    try {
      await NotificationService().initialize();

      final prefs = await SharedPreferences.getInstance();
      final remindersJson = prefs.getString('reminders');

      List<Reminder> reminders = [];
      if (remindersJson != null) {
        final List<dynamic> decodedList = json.decode(remindersJson);
        reminders = decodedList.map((item) => Reminder.fromJson(item)).toList();

        // Cache all reminders for notification navigation
        for (final reminder in reminders) {
          NotificationService().cacheReminder(reminder.id, reminder);
        }
      }

      // Schedule all reminders as local notifications (works even when screen is locked)
      await BackgroundAlarmService().scheduleAllReminders(reminders);

      // Start foreground alarm monitor (auto-shows notification screen when app is open)
      ForegroundAlarmMonitor().startMonitoring(reminders);
    } catch (e) {
      print('⚠️ Failed to initialize BackgroundAlarmService: $e');
    }
  }

  @override
  void dispose() {
    // Stop foreground monitoring when app closes
    ForegroundAlarmMonitor().stopMonitoring();
    super.dispose();
  }

  void _updateScreens() {
    _screens = [
      const HomeScreen(),
      const MedicineReminderScreen(),
      FavoritesScreen(key: ValueKey(_favoritesRefreshKey)),
      const SettingsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          // Reload favorites when switching to favorites tab
          if (index == 2 && _currentIndex != 2) {
            setState(() {
              _favoritesRefreshKey++;
              _updateScreens();
              _currentIndex = index;
            });
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2E7D32),
        unselectedItemColor: Colors.black54,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        iconSize: 24,
        elevation: 10,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications_outlined),
            activeIcon: const Icon(Icons.notifications),
            label: AppLocalizations.of(context)!.reminders,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_outline),
            activeIcon: const Icon(Icons.favorite),
            label: AppLocalizations.of(context)!.favorites,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_outlined),
            activeIcon: const Icon(Icons.settings),
            label: AppLocalizations.of(context)!.settings,
          ),
        ],
      ),
    );
  }
}

// Placeholder screen for tabs that aren't implemented yet
class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.black.withValues(alpha: 0.05),
        surfaceTintColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.construction, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              '$title - Coming Soon',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'This feature is under development',
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }
}
