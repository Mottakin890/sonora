import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeBasedHeader extends StatefulWidget {
  const TimeBasedHeader({super.key});

  @override
  State<TimeBasedHeader> createState() => _TimeBasedHeaderState();
}

class _TimeBasedHeaderState extends State<TimeBasedHeader> {
  late List<String> _messages;
  int _currentMessageIndex = 0;
  String _displayedText = '';
  int _charIndex = 0;
  bool _isTyping = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _messages = _getMessagesForTime();
    if (_messages.isNotEmpty) {
      _startTyping();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  List<String> _getMessagesForTime() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return [
        'Good morning...',
        'Start your day with music...',
        'Wake up and listen...',
      ];
    } else if (hour >= 12 && hour < 17) {
      return [
        'Good afternoon...',
        'Keep the focus going...',
        'Time for a quick break...',
      ];
    } else if (hour >= 17 && hour < 21) {
      return [
        'Good evening...',
        'Wind down with tunes...',
        'Relax and listen...',
      ];
    } else {
      return [
        'Good night...',
        'Late night vibes...',
        'Sleep tight with music...',
      ];
    }
  }

  void _startTyping() {
    _isTyping = true;
    _charIndex = 0;
    _displayedText = '';

    final currentMessage = _messages[_currentMessageIndex];

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_charIndex < currentMessage.length) {
        setState(() {
          _charIndex++;
          _displayedText = currentMessage.substring(0, _charIndex);
        });
      } else {
        timer.cancel();
        _scheduleErase();
      }
    });
  }

  void _scheduleErase() {
    _timer = Timer(const Duration(seconds: 3), _startErasing);
  }

  void _startErasing() {
    _isTyping = false;
    final currentMessage = _messages[_currentMessageIndex];
    _charIndex = currentMessage.length;

    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (_charIndex > 0) {
        setState(() {
          _charIndex--;
          _displayedText = currentMessage.substring(0, _charIndex);
        });
      } else {
        timer.cancel();
        _currentMessageIndex = (_currentMessageIndex + 1) % _messages.length;
        _timer = Timer(const Duration(milliseconds: 500), _startTyping);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          _displayedText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Cursor
        AnimatedOpacity(
          opacity: _isTyping || _charIndex > 0 ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: Container(
            margin: EdgeInsets.only(bottom: 4.h, left: 2.w),
            width: 2.w,
            height: 20.h,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
