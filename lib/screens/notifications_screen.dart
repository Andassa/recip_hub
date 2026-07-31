import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/mock_notifications.dart';
import '../models/app_notification.dart';
import '../theme/app_colors.dart';
import '../utils/responsive.dart';
import '../widgets/category_chip.dart';
import '../widgets/notifications/notification_card.dart';

/// Écran Notifications Figma (All / Read / Unread).
class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  String _filter = 'All';

  List<AppNotification> get _filtered {
    return mockNotifications.where((n) {
      if (_filter == 'Read') return n.isRead;
      if (_filter == 'Unread') return !n.isRead;
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final pad = horizontalPadding(context);
    final items = _filtered;
    final groups = <String, List<AppNotification>>{};
    for (final n in items) {
      groups.putIfAbsent(n.dayGroup, () => []).add(n);
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: pad),
        children: [
          Row(
            children: ['All', 'Read', 'Unread'].map((f) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CategoryChip(
                  label: f,
                  isSelected: _filter == f,
                  onTap: () => setState(() => _filter = f),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          if (items.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Center(
                child: Text(
                  'No notifications',
                  style: GoogleFonts.poppins(color: AppColors.textMuted),
                ),
              ),
            )
          else
            ...groups.entries.expand(
              (e) => [
                Text(
                  e.key,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                ...e.value.map((n) => NotificationCard(notification: n)),
                const SizedBox(height: 8),
              ],
            ),
        ],
      ),
    );
  }
}
