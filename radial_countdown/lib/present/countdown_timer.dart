import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'component/countdown_ring.dart';
import 'component/countdown_ring_by_painter.dart';
import 'component/remaining_time_text.dart';

/// Main demo UI (countdown + restart button)
class CountdownTimer extends StatefulWidget {
  const CountdownTimer({
    super.key,
    required this.maxRemainingTime,
    this.drawRingByPainter = false,
  });

  final bool drawRingByPainter;

  final Duration maxRemainingTime;

  @override
  CountdownTimerState createState() => CountdownTimerState();
}

class CountdownTimerState extends State<CountdownTimer>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;

  Duration remainingTime = Duration.zero;

  double get remainingTimeRatio =>
      remainingTime.inMilliseconds / widget.maxRemainingTime.inMilliseconds;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      final newRemainingTime = widget.maxRemainingTime - elapsed;

      setState(() {
        if (newRemainingTime.inMilliseconds < 0) {
          remainingTime = Duration.zero;
          _ticker.stop();
        } else {
          remainingTime = newRemainingTime;
        }
      });
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var ringBackgroundColor = Colors.purple;
    var ringForegroundColor = Colors.indigo;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            if (widget.drawRingByPainter)
              CountdownRing(
                remainingRatio: remainingTimeRatio,
                backgroundColor: ringBackgroundColor,
                foregroundColor: ringForegroundColor,
              )
            else
              CountdownRingByPainter(
                remainingRatio: remainingTimeRatio,
                backgroundColor: ringBackgroundColor,
                foregroundColor: ringForegroundColor,
              ),
            RemainingTimeText(
              remainingTime: remainingTime,
            ),
          ],
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {
            setState(() {
              // 停止並重置
              _ticker.stop();
              // 再次開始
              _ticker.start();
            });
          },
          child: const Text(
            'Restart',
            style: TextStyle(fontSize: 32),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
