import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/user_model.dart';
import 'chat_screen.dart';
import 'calls_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),
        foregroundColor: Colors.white,
        title: const Text(
          'Jom Borak',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          tabs: const [
            Tab(text: 'SEMBANG'),
            Tab(text: 'PANGGILAN'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _ChatListTab(),
          const CallsScreen(),
        ],
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton(
              backgroundColor: const Color(0xFF25D366),
              child: const Icon(Icons.chat, color: Colors.white),
              onPressed: () {},
            )
          : null,
    );
  }
}

class _ChatListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 8),
      itemCount: mockUsers.length,
      separatorBuilder: (_, __) => const Divider(
        height: 1,
        indent: 72,
        color: Color(0xFFEEEEEE),
      ),
      itemBuilder: (_, i) => _ChatTile(user: mockUsers[i]),
    );
  }
}

class _ChatTile extends StatelessWidget {
  final UserModel user;
  const _ChatTile({required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ChatScreen(user: user)),
        );
      },
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: const Color(0xFF075E54),
            child: Text(
              user.avatarInitials,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          if (user.isOnline)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 13,
                height: 13,
                decoration: BoxDecoration(
                  color: const Color(0xFF25D366),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
        ],
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              user.name,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          Text(
            user.time,
            style: TextStyle(
              fontSize: 12,
              color: user.unreadCount > 0
                  ? const Color(0xFF25D366)
                  : Colors.black45,
            ),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Text(
              user.lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
          if (user.unreadCount > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFF25D366),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${user.unreadCount}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
