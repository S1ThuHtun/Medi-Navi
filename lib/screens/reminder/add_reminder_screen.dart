import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../l10n/app_localizations.dart';
import '../../models/reminder.dart';

class AddReminderScreen extends StatefulWidget {
  final Reminder? existingReminder; // For editing existing reminders

  const AddReminderScreen({Key? key, this.existingReminder}) : super(key: key);

  @override
  State<AddReminderScreen> createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  final TextEditingController _medicineController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  TimeOfDay _selectedTime = TimeOfDay.now();
  String _selectedRepeat = 'never'; // Default to 'never' (one-time reminder)
  List<int> _selectedDays = [];
  String? _photoPath;
  String _mealTiming = 'none'; // 'none', 'before', 'after'
  int _dosesPerDay = 1;
  bool _isEditMode = false;
  String? _reminderId;

  @override
  void initState() {
    super.initState();
    // If editing an existing reminder, pre-fill all fields
    if (widget.existingReminder != null) {
      _isEditMode = true;
      final reminder = widget.existingReminder!;
      _reminderId = reminder.id;
      _medicineController.text = reminder.medicineName;
      _photoPath = reminder.photoPath;
      _mealTiming = reminder.mealTiming;
      _dosesPerDay = reminder.dosesPerDay;
      _selectedRepeat = reminder.repeatType;
      _selectedDays = reminder.customDays ?? [];

      // Parse time string back to TimeOfDay
      final timeParts = reminder.time.split(':');
      if (timeParts.length == 2) {
        _selectedTime = TimeOfDay(
          hour: int.tryParse(timeParts[0]) ?? TimeOfDay.now().hour,
          minute: int.tryParse(timeParts[1]) ?? TimeOfDay.now().minute,
        );
      }
    }
  }

  @override
  void dispose() {
    _medicineController.dispose();
    super.dispose();
  }

  // Generate dose times based on selected time
  List<String> _generateDoseTimes() {
    return [_selectedTime.format(context)];
  }

  // Show time picker
  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (context, child) {
        return Localizations.override(
          context: context,
          locale: const Locale('en', 'US'),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: Theme(
              data: ThemeData.light().copyWith(
                useMaterial3: true,
                colorScheme: const ColorScheme.light(
                  primary: Color(0xFF2E7D32),
                  onPrimary: Colors.white,
                  surface: Colors.white,
                  onSurface: Colors.black,
                ),
                timePickerTheme: TimePickerThemeData(
                  backgroundColor: Colors.white,
                  dialBackgroundColor: const Color(0xFFE8F5E9),
                  dialHandColor: const Color(0xFF2E7D32),
                  dialTextColor: MaterialStateColor.resolveWith(
                    (states) => states.contains(MaterialState.selected)
                        ? Colors.white
                        : const Color(0xFF2E7D32),
                  ),
                  hourMinuteTextColor: MaterialStateColor.resolveWith(
                    (states) => states.contains(MaterialState.selected)
                        ? Colors.white
                        : const Color(0xFF2E7D32),
                  ),
                  hourMinuteColor: MaterialStateColor.resolveWith(
                    (states) => states.contains(MaterialState.selected)
                        ? const Color(0xFF2E7D32)
                        : const Color(0xFFE8F5E9),
                  ),
                  hourMinuteShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  dayPeriodColor: MaterialStateColor.resolveWith(
                    (states) => states.contains(MaterialState.selected)
                        ? const Color(0xFF2E7D32)
                        : Colors.white,
                  ),
                  dayPeriodTextColor: MaterialStateColor.resolveWith(
                    (states) => states.contains(MaterialState.selected)
                        ? Colors.white
                        : const Color(0xFF2E7D32),
                  ),
                  dayPeriodShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: child!,
            ),
          ),
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  // Save reminder and return to previous screen
  void _saveReminder() {
    if (_medicineController.text.trim().isEmpty) {
      return;
    }

    final reminder = Reminder(
      id: _isEditMode
          ? _reminderId!
          : DateTime.now().millisecondsSinceEpoch.toString(),
      medicineName: _medicineController.text.trim(),
      time: _selectedTime.format(context),
      repeatType: _selectedRepeat,
      customDays: _selectedRepeat == 'custom' ? _selectedDays : null,
      photoPath: _photoPath,
      mealTiming: _mealTiming,
      dosesPerDay: _dosesPerDay,
      doseTimes: _generateDoseTimes(),
    );

    Navigator.pop(context, reminder);
  }

  // Pick image from camera or gallery
  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _photoPath = image.path;
        });
      }
    } catch (e) {
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.reminderPhotoPickError(e.toString())),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Show image source selection dialog
  void _showImageSourceDialog() {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.reminderAddPhotoTitle,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(
                Icons.camera_alt,
                color: Colors.green,
                size: 28,
              ),
              title: Text(
                l10n.reminderPhotoFromCamera,
                style: const TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.photo_library,
                color: Colors.blue,
                size: 28,
              ),
              title: Text(
                l10n.reminderPhotoFromGallery,
                style: const TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
            if (_photoPath != null)
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red, size: 28),
                title: Text(
                  l10n.reminderPhotoRemove,
                  style: const TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _photoPath = null;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }

  // Show repeat options dialog
  void _showRepeatOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.75,
        ),
        child: _buildRepeatOptionsSheet(),
      ),
    );
  }

  // Build repeat options sheet
  Widget _buildRepeatOptionsSheet() {
    return StatefulBuilder(
      builder: (context, setModalState) {
        final l10n = AppLocalizations.of(context)!;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.reminderRepeatSettingsTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E7D32),
                  ),
                ),
                const SizedBox(height: 20),
                _buildRepeatOption(
                  l10n.reminderRepeatNever,
                  'never',
                  setModalState,
                ),
                _buildRepeatOption(
                  l10n.reminderRepeatEveryday,
                  'everyday',
                  setModalState,
                ),
                _buildRepeatOption(
                  l10n.reminderRepeatWeekdays,
                  'weekdays',
                  setModalState,
                ),
                _buildRepeatOption(
                  l10n.reminderRepeatWeekends,
                  'weekends',
                  setModalState,
                ),
                _buildRepeatOption(
                  l10n.reminderRepeatCustomOption,
                  'custom',
                  setModalState,
                ),
                if (_selectedRepeat == 'custom') ...[
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  _buildDaySelector(setModalState),
                ],
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {}); // Update main state
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      l10n.reminderRepeatDone,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
              ],
            ),
          ),
        );
      },
    );
  }

  // Build repeat option item
  Widget _buildRepeatOption(
    String label,
    String value,
    StateSetter setModalState,
  ) {
    final isSelected = _selectedRepeat == value;
    return InkWell(
      onTap: () {
        setModalState(() {
          _selectedRepeat = value;
          if (value == 'weekdays') {
            _selectedDays = [0, 1, 2, 3, 4]; // Mon-Fri
          } else if (value == 'weekends') {
            _selectedDays = [5, 6]; // Sat-Sun
          } else if (value != 'custom') {
            _selectedDays = [];
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE8F5E9) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected ? Colors.green : Colors.grey,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? const Color(0xFF2E7D32) : Colors.black87,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build day selector for custom repeat
  Widget _buildDaySelector(StateSetter setModalState) {
    final l10n = AppLocalizations.of(context)!;
    final dayNames = [
      l10n.reminderDayMonShort,
      l10n.reminderDayTueShort,
      l10n.reminderDayWedShort,
      l10n.reminderDayThuShort,
      l10n.reminderDayFriShort,
      l10n.reminderDaySatShort,
      l10n.reminderDaySunShort,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.reminderSelectDays,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF66BB6A),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(7, (index) {
            final isSelected = _selectedDays.contains(index);
            return InkWell(
              onTap: () {
                setModalState(() {
                  if (isSelected) {
                    _selectedDays.remove(index);
                  } else {
                    _selectedDays.add(index);
                  }
                  _selectedDays.sort();
                });
              },
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.green : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Colors.green : Colors.grey.shade300,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    dayNames[index],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.grey.shade700,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  // Get repeat text for display
  String _getRepeatText(AppLocalizations l10n) {
    switch (_selectedRepeat) {
      case 'everyday':
        return l10n.reminderRepeatEveryday;
      case 'weekdays':
        return l10n.reminderRepeatWeekdays;
      case 'weekends':
        return l10n.reminderRepeatWeekends;
      case 'custom':
        if (_selectedDays.isEmpty) {
          return l10n.reminderSelectDays;
        }
        final dayNames = [
          l10n.reminderDayMonShort,
          l10n.reminderDayTueShort,
          l10n.reminderDayWedShort,
          l10n.reminderDayThuShort,
          l10n.reminderDayFriShort,
          l10n.reminderDaySatShort,
          l10n.reminderDaySunShort,
        ];
        final days = _selectedDays
            .map((i) => dayNames[i])
            .join(l10n.reminderDaySeparator);
        return l10n.reminderEveryWeekDays(days);
      case 'never':
      default:
        return l10n.reminderRepeatNever;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.black.withValues(alpha: 0.05),
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          _isEditMode ? l10n.reminderEditTitle : l10n.reminderAddTitle,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2E7D32),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            icon: const Icon(Icons.close, color: Color(0xFF2E7D32)),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 24,
              bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Medicine name input
                Row(
                  children: [
                    const Icon(Icons.medication, color: Colors.pink, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      l10n.reminderMedicineNameLabel,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF2E7D32),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _medicineController,
                  decoration: InputDecoration(
                    hintText: l10n.reminderMedicineNameHint,
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    filled: true,
                    fillColor: const Color(0xFFE8F5E9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Photo section
                Row(
                  children: [
                    const Icon(
                      Icons.camera_alt,
                      color: Colors.purple,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l10n.reminderPhotoLabel,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF2E7D32),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l10n.reminderPhotoOptional,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: _showImageSourceDialog,
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.green,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: _photoPath != null
                        ? Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  File(_photoPath!),
                                  width: double.infinity,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(
                                          alpha: 0.2,
                                        ),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                    onPressed: _showImageSourceDialog,
                                    padding: const EdgeInsets.all(8),
                                    constraints: const BoxConstraints(),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_photo_alternate,
                                  size: 40,
                                  color: Colors.green.shade300,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  l10n.reminderAddPhotoButton,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.green.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 24),

                // Time input
                Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.grey, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      l10n.reminderTimeLabel,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF2E7D32),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: _selectTime,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green, width: 2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _selectedTime.format(context),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF2E7D32),
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Repeat input
                Row(
                  children: [
                    const Icon(Icons.repeat, color: Colors.blue, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      l10n.reminderRepeatLabel,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF2E7D32),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: _showRepeatOptions,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green, width: 2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _getRepeatText(l10n),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF2E7D32),
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Meal timing selector
                Row(
                  children: [
                    const Icon(
                      Icons.restaurant,
                      color: Colors.orange,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l10n.reminderMealTimingLabel,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // None option
                InkWell(
                  onTap: () {
                    setState(() {
                      _mealTiming = 'none';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _mealTiming == 'none'
                          ? const Color(0xFFE8F5E9)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _mealTiming == 'none'
                            ? const Color(0xFF66BB6A)
                            : Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          _mealTiming == 'none'
                              ? Icons.radio_button_checked
                              : Icons.radio_button_unchecked,
                          color: _mealTiming == 'none'
                              ? const Color(0xFF66BB6A)
                              : Colors.grey,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          l10n.reminderMealTimingNone,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Before meal option
                InkWell(
                  onTap: () {
                    setState(() {
                      _mealTiming = 'before';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _mealTiming == 'before'
                          ? const Color(0xFFFFF3E0)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _mealTiming == 'before'
                            ? Colors.orange.shade300
                            : Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          _mealTiming == 'before'
                              ? Icons.radio_button_checked
                              : Icons.radio_button_unchecked,
                          color: _mealTiming == 'before'
                              ? Colors.orange
                              : Colors.grey,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.restaurant_menu,
                                    color: Colors.orange.shade700,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    l10n.reminderMealTimingBeforeTitle,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange.shade900,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                l10n.reminderMealTimingBeforeSubtitle,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.orange.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // After meal option
                InkWell(
                  onTap: () {
                    setState(() {
                      _mealTiming = 'after';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _mealTiming == 'after'
                          ? const Color(0xFFFFF3E0)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _mealTiming == 'after'
                            ? Colors.orange.shade300
                            : Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          _mealTiming == 'after'
                              ? Icons.radio_button_checked
                              : Icons.radio_button_unchecked,
                          color: _mealTiming == 'after'
                              ? Colors.orange
                              : Colors.grey,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.restaurant,
                                    color: Colors.orange.shade700,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    l10n.reminderMealTimingAfterTitle,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange.shade900,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                l10n.reminderMealTimingAfterSubtitle,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.orange.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Save/Cancel Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          side: const BorderSide(color: Colors.green, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          l10n.reminderCancel,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _saveReminder,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          _isEditMode ? l10n.reminderUpdate : l10n.reminderAdd,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
