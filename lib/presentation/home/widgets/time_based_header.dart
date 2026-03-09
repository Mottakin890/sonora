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
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _messages = _getMessagesForTime();
    _startMessageCycle();
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
        'Good morning',
        'Start your day with music',
        'Wake up and listen',
      ];
    } else if (hour >= 12 && hour < 17) {
      return [
        'Good afternoon',
        'Keep the focus going',
        'Time for a quick break',
      ];
    } else if (hour >= 17 && hour < 21) {
      return [
        'Good evening',
        'Wind down with tunes',
        'Relax and listen',
      ];
    } else {
      return [
        'Good night',
        'Late night vibes',
        'Sleep tight with music',
      ];
    }
  }

  void _startMessageCycle() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (mounted) {
        setState(() {
          _currentMessageIndex = (_currentMessageIndex + 1) % _messages.length;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        layoutBuilder: (currentChild, previousChildren) {
          return Stack(
            alignment: Alignment.centerLeft,
            children: [
              ...previousChildren,
              ?currentChild,
            ],
          );
        },
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: Text(
          _messages[_currentMessageIndex],
          key: ValueKey<int>(_currentMessageIndex),
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
