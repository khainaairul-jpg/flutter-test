import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/call_model.dart';
import 'calling_screen.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 8),
        itemCount: mockCalls.length,
        separatorBuilder: (_, __) => const Divider(
          height: 1,
          indent: 72,
          color: Color(0xFFEEEEEE),
        ),
        itemBuilder: (_, i) => _CallTile(call: mockCalls[i]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF25D366),
        child: const Icon(Icons.add_call, color: Colors.white),
        onPressed: () {},
      ),
    );
  }
}

class _CallTile extends StatelessWidget {
  final CallModel call;
  const _CallTile({required this.call});

  Color get _statusColor {
    switch (call.callStatus) {
      case CallStatus.missed:
        return Colors.red;
      case CallStatus.incoming:
        return const Color(0xFF25D366);
      case CallStatus.outgoing:
        return Colors.blue;
    }
  }

  IconData get _statusIcon {
    switch (call.callStatus) {
      case CallStatus.missed:
        return Icons.call_missed;
      case CallStatus.incoming:
        return Icons.call_received;
      case CallStatus.outgoing:
        return Icons.call_made;
    }
  }

  String get _statusLabel {
    switch (call.callStatus) {
      case CallStatus.missed:
        return 'Terlepas';
      case CallStatus.incoming:
        return 'Masuk';
      case CallStatus.outgoing:
        return 'Keluar';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: CircleAvatar(
        radius: 26,
        backgroundColor: const Color(0xFF075E54),
        child: Text(
          call.avatarInitials,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      title: Text(
        call.name,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: call.callStatus == CallStatus.missed ? Colors.red : Colors.black87,
        ),
      ),
      subtitle: Row(
        children: [
          Icon(_statusIcon, size: 14, color: _statusColor),
          const SizedBox(width: 4),
          Text(
            '$_statusLabel • ${call.time}',
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          call.callType == CallType.video ? Icons.videocam : Icons.call,
          color: const Color(0xFF075E54),
          size: 26,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CallingScreen(
                userName: call.name,
                isVideo: call.callType == CallType.video,
              ),
            ),
          );
        },
      ),
    );
  }
}
