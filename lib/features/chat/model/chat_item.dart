class ChatItem {
  const ChatItem({
    required this.name,
    required this.lastMsg,
    required this.lastMsgTime,
    required this.unreadCount,
    required this.dp,
  });

  final String name;
  final String lastMsg;
  final String lastMsgTime;
  final String unreadCount;
  final String dp;
}
