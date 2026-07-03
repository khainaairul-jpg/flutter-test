class UserModel {
  final String id;
  final String name;
  final String avatarInitials;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final bool isOnline;

  const UserModel({
    required this.id,
    required this.name,
    required this.avatarInitials,
    required this.lastMessage,
    required this.time,
    this.unreadCount = 0,
    this.isOnline = false,
  });
}
