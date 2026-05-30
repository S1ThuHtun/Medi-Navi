import 'package:flutter/material.dart';
import '../home_screen.dart';
import 'medicine_reminder_screen.dart';
import '../settings_screen.dart';
import '../chatbot_screen.dart';

class ReminderNavigationScreen extends StatefulWidget {
  const ReminderNavigationScreen({super.key});

  @override
  State<ReminderNavigationScreen> createState() =>
      _ReminderNavigationScreenState();
}

class _ReminderNavigationScreenState extends State<ReminderNavigationScreen> {
  int _currentIndex = 0;

  // List of screens for bottom navigation
  final List<Widget> _screens = [
    const HomeScreen(), // Medical Services Finder
    const MedicineReminderScreen(), // Medicine Reminder
    const ChatbotScreen(), // AI Medical Assistant
    const SettingsScreen(), // Settings
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2E7D32), // MediNavi green
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication),
            label: 'Medicine',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'AI Assistant',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
