import 'dart:async';
import 'package:flutter/material.dart';

class CallingScreen extends StatefulWidget {
  final String userName;
  final bool isVideo;

  const CallingScreen({
    super.key,
    required this.userName,
    required this.isVideo,
  });

  @override
  State<CallingScreen> createState() => _CallingScreenState();
}

class _CallingScreenState extends State<CallingScreen> {
  int _seconds = 0;
  Timer? _timer;
  bool _isMuted = false;
  bool _isSpeakerOn = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _seconds++);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formattedTime {
    final m = (_seconds ~/ 60).toString().padLeft(2, '0');
    final s = (_seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Text(
              widget.isVideo ? 'Panggilan Video' : 'Panggilan Suara',
              style: const TextStyle(color: Colors.white54, fontSize: 16),
            ),
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundColor: const Color(0xFF075E54),
              child: Text(
                widget.userName.substring(0, 2).toUpperCase(),
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              widget.userName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _formattedTime,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontFeatures: [FontFeature.tabularFigures()],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildControlButton(
                    icon: _isMuted ? Icons.mic_off : Icons.mic,
                    label: _isMuted ? 'Nyahsenyap' : 'Senyap',
                    onTap: () => setState(() => _isMuted = !_isMuted),
                  ),
                  _buildControlButton(
                    icon: _isSpeakerOn ? Icons.volume_up : Icons.volume_down,
                    label: 'Speaker',
                    onTap: () => setState(() => _isSpeakerOn = !_isSpeakerOn),
                  ),
                  if (widget.isVideo)
                    _buildControlButton(
                      icon: Icons.flip_camera_ios,
                      label: 'Tukar',
                      onTap: () {},
                    ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 72,
                height: 72,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.call_end, color: Colors.white, size: 32),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Tamatkan Panggilan',
              style: TextStyle(color: Colors.white54, fontSize: 13),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Icon(icon, color: Colors.white, size: 26),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.white54, fontSize: 12)),
        ],
      ),
    );
  }
}
