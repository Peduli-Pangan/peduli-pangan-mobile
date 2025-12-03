import 'dart:async';
import 'package:flutter/material.dart';

class SurplusCountdown extends StatefulWidget {
  final String endTime; // Format: "HH:mm" or "HH:mm WIB"
  final TextStyle? style;

  const SurplusCountdown({super.key, required this.endTime, this.style});

  @override
  State<SurplusCountdown> createState() => _SurplusCountdownState();
}

class _SurplusCountdownState extends State<SurplusCountdown> {
  late Timer _timer;
  Duration _timeLeft = Duration.zero;

  @override
  void initState() {
    super.initState();
    _calculateTimeLeft();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _calculateTimeLeft();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _calculateTimeLeft() {
    try {
      final now = DateTime.now();

      // Clean up the time string (remove " WIB", etc.)
      final timeString =
          widget.endTime.replaceAll(RegExp(r'[^\d:]'), '').trim();
      final parts = timeString.split(':');

      if (parts.length >= 2) {
        final hour = int.parse(parts[0]);
        final minute = int.parse(parts[1]);

        DateTime endDateTime = DateTime(
          now.year,
          now.month,
          now.day,
          hour,
          minute,
        );

        // If end time is earlier today, it might mean tomorrow (though for surplus usually it's today)
        // But for now let's assume it's today. If it's already passed, it's 0.

        final difference = endDateTime.difference(now);

        if (difference.isNegative) {
          setState(() {
            _timeLeft = Duration.zero;
          });
        } else {
          setState(() {
            _timeLeft = difference;
          });
        }
      }
    } catch (e) {
      // Fallback if parsing fails
      setState(() {
        _timeLeft = Duration.zero;
      });
      debugPrint("Error parsing time: $e");
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatDuration(_timeLeft),
      style:
          widget.style ??
          const TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.bold),
    );
  }
}
