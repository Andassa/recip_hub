import '../models/app_notification.dart';

/// Notifications mock — hors des widgets.
const mockNotifications = [
  AppNotification(
    id: 'n1',
    title: 'New Recipe Alert!',
    body:
        'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum',
    timeLabel: '10 mins ago',
    dayGroup: 'Today',
  ),
  AppNotification(
    id: 'n2',
    title: 'New Recipe Alert!',
    body:
        'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum',
    timeLabel: '30 mins ago',
    dayGroup: 'Today',
    isRead: true,
  ),
  AppNotification(
    id: 'n3',
    title: 'Save Recipe Alert!',
    body:
        'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum',
    timeLabel: '1 day ago',
    dayGroup: 'Yesterday',
    isRead: true,
  ),
  AppNotification(
    id: 'n4',
    title: 'New Recipe Alert!',
    body:
        'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum',
    timeLabel: '1 day ago',
    dayGroup: 'Yesterday',
  ),
];
