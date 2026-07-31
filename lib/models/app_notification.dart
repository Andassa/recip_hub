/// Notification affichée dans l'écran Notifications.
class AppNotification {
  const AppNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.timeLabel,
    required this.dayGroup,
    this.isRead = false,
  });

  final String id;
  final String title;
  final String body;
  final String timeLabel;
  final String dayGroup; // Today | Yesterday
  final bool isRead;

  AppNotification copyWith({bool? isRead}) {
    return AppNotification(
      id: id,
      title: title,
      body: body,
      timeLabel: timeLabel,
      dayGroup: dayGroup,
      isRead: isRead ?? this.isRead,
    );
  }
}
