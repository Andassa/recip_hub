import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/mock_notifications.dart';
import '../l10n/app_localizations.dart';
import '../l10n/labels.dart';
import '../models/app_notification.dart';
import '../theme/app_colors.dart';
import '../utils/responsive.dart';
import '../widgets/category_chip.dart';
import '../widgets/notifications/notification_card.dart';

class NotificationsScreen extends HookWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final filter = useState('All');
    final l10n = AppLocalizations.of(context);
    final pad = horizontalPadding(context);
    final items = mockNotifications.where((n) {
      if (filter.value == 'Read') return n.isRead;
      if (filter.value == 'Unread') return !n.isRead;
      return true;
    }).toList();
    final groups = <String, List<AppNotification>>{};
    for (final n in items) {
      groups.putIfAbsent(n.dayGroup, () => []).add(n);
    }

    final tiles = <Widget>[
      Row(
        children: ['All', 'Read', 'Unread'].map((f) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CategoryChip(
              label: notificationFilterLabel(l10n, f),
              isSelected: filter.value == f,
              onTap: () => filter.value = f,
            ),
          );
        }).toList(),
      ),
      const SizedBox(height: 20),
    ];
    if (items.isEmpty) {
      tiles.add(
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Center(
            child: Text(
              l10n.noNotifications,
              style: GoogleFonts.poppins(color: AppColors.textMuted),
            ),
          ),
        ),
      );
    } else {
      for (final entry in groups.entries) {
        tiles.add(
          Text(
            entry.key,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
        tiles.add(const SizedBox(height: 12));
        tiles.addAll(entry.value.map((n) => NotificationCard(notification: n)));
        tiles.add(const SizedBox(height: 8));
      }
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          l10n.notifications,
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: pad),
        itemCount: tiles.length,
        itemBuilder: (_, index) => tiles[index],
      ),
    );
  }
}
