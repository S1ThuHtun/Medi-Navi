import 'package:flutter/material.dart';
import 'dart:io';
import '../l10n/app_localizations.dart';
import '../models/reminder.dart';

class ReminderCard extends StatelessWidget {
  final Reminder reminder;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onAlarm;

  const ReminderCard({
    Key? key,
    required this.reminder,
    required this.onToggle,
    required this.onDelete,
    required this.onTap,
    required this.onEdit,
    required this.onAlarm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    String repeatLabel() {
      switch (reminder.repeatType) {
        case 'everyday':
          return l10n.reminderRepeatEveryday;
        case 'weekdays':
          return l10n.reminderRepeatWeekdays;
        case 'weekends':
          return l10n.reminderRepeatWeekends;
        case 'custom':
          if (reminder.customDays == null || reminder.customDays!.isEmpty) {
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
          final days = reminder.customDays!
              .map((i) => dayNames[i])
              .join(l10n.reminderDaySeparator);
          return l10n.reminderEveryWeekDays(days);
        case 'never':
        default:
          return l10n.reminderRepeatNever;
      }
    }

    String mealTimingLabel() {
      switch (reminder.mealTiming) {
        case 'before':
          return l10n.reminderMealTimingBeforeTitle;
        case 'after':
          return l10n.reminderMealTimingAfterTitle;
        default:
          return '';
      }
    }

    return Dismissible(
      key: Key(reminder.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(),
      background: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white, size: 32),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: reminder.photoPath == null
                          ? const LinearGradient(
                              colors: [Color(0xFFFF6B9D), Color(0xFFFF9A56)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                          : null,
                      borderRadius: BorderRadius.circular(12),
                      image: reminder.photoPath != null
                          ? DecorationImage(
                              image: FileImage(File(reminder.photoPath!)),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: reminder.photoPath == null
                        ? const Icon(
                            Icons.medication,
                            color: Colors.white,
                            size: 28,
                          )
                        : null,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reminder.medicineName,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: reminder.isEnabled
                                ? const Color(0xFF2E7D32)
                                : Colors.grey,
                            decoration: reminder.isEnabled
                                ? TextDecoration.none
                                : TextDecoration.lineThrough,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 14,
                              color: reminder.isEnabled
                                  ? const Color(0xFF66BB6A)
                                  : Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                reminder.time,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: reminder.isEnabled
                                      ? const Color(0xFF66BB6A)
                                      : Colors.grey,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        if (reminder.repeatType != 'never') ...[
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              Icon(
                                Icons.repeat,
                                size: 14,
                                color: reminder.isEnabled
                                    ? Colors.blue.shade300
                                    : Colors.grey,
                              ),
                              const SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  repeatLabel(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: reminder.isEnabled
                                        ? Colors.blue.shade300
                                        : Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                        if (reminder.mealTiming != 'none') ...[
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              Icon(
                                reminder.isBeforeMeal
                                    ? Icons.restaurant_menu
                                    : Icons.restaurant,
                                size: 14,
                                color: reminder.isEnabled
                                    ? Colors.orange.shade400
                                    : Colors.grey,
                              ),
                              const SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  mealTimingLabel(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: reminder.isEnabled
                                        ? Colors.orange.shade600
                                        : Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: onAlarm,
                        icon: const Icon(
                          Icons.alarm,
                          color: Colors.orange,
                          size: 22,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 36,
                          minHeight: 36,
                        ),
                        tooltip: l10n.reminderTestAlarmTooltip,
                      ),
                      IconButton(
                        onPressed: onEdit,
                        icon: const Icon(
                          Icons.edit,
                          color: Color(0xFF2E7D32),
                          size: 22,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 36,
                          minHeight: 36,
                        ),
                      ),
                      Transform.scale(
                        scale: 0.9,
                        child: Switch(
                          value: reminder.isEnabled,
                          onChanged: (_) => onToggle(),
                          activeColor: const Color(0xFF2E7D32),
                          activeTrackColor: const Color(
                            0xFF2E7D32,
                          ).withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
