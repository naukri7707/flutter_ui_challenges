import 'dart:math';

import 'package:flutter/material.dart';

class CountdownRingByPainter extends StatelessWidget {
  const CountdownRingByPainter({
    super.key,
    required this.remainingRatio,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final double remainingRatio;

  final Color backgroundColor;

  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // 設定進度條寬度為申請範圍的 1/16
      final ringStrokeWidth = constraints.maxWidth / 16;
      return AspectRatio(
        aspectRatio: 1.0,
        child: CustomPaint(
          painter: RingPainter(
            ratio: remainingRatio,
            strokeWidth: ringStrokeWidth,
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
          ),
        ),
      );
    });
  }
}

class RingPainter extends CustomPainter {
  RingPainter({
    required this.ratio,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.foregroundColor,
    super.repaint,
  });

  final double ratio;

  final double strokeWidth;

  final Color backgroundColor;

  final Color foregroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final backgroundRing = Paint()
      ..isAntiAlias = true
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final foregroundRing = Paint()
      ..isAntiAlias = true
      ..color = foregroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    // 背景圓環
    canvas.drawCircle(center, radius, backgroundRing);
    // 弧形進度條
    canvas.drawArc(
      // 圓形基礎屬性
      Rect.fromCircle(center: center, radius: radius),
      // 起始位置 (正上)
      -pi / 2,
      // 繪製多少角度 (從 start 開始繪製 sweep 度)
      2 * pi * ratio,
      // 起始和結束位置是否與中心點相連
      false,
      // 畫筆
      foregroundRing,
    );
  }

  @override
  bool shouldRepaint(covariant RingPainter oldDelegate) {
    return oldDelegate.ratio != ratio || oldDelegate.strokeWidth != strokeWidth;
  }
}
