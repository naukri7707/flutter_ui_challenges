import 'package:flutter/material.dart';

class CountdownRing extends StatelessWidget {
  const CountdownRing({
    super.key,
    required this.remainingRatio,
  });

  final double remainingRatio;

  @override
  Widget build(BuildContext context) {
    // 使用 AspectRatio 以在不明確指定長寬值的前提下定義長寬比例
    return LayoutBuilder(builder: (context, constraints) {
      // 設定進度條寬度為申請範圍的 1/16
      final ringStrokeWidth = constraints.maxWidth / 16;
      return AspectRatio(
        // 指定長寬比為 1:1
        aspectRatio: 1,
        child: Padding(
          // 由於 strokeWidth 被加粗的話 CircularProgressIndicator 會超過申請的寬度
          // 所以用 padding 來修正以避免被裁切到
          // padding = ringStrokeWidth / 2 是因為加粗是由中心向兩邊延伸，我們只要修正向外部延伸的區域
          padding: EdgeInsets.all(ringStrokeWidth / 2),
          child: CircularProgressIndicator(
            value: remainingRatio,
            // 加粗進度條
            strokeWidth: ringStrokeWidth,
            backgroundColor: Colors.purple,
            valueColor: const AlwaysStoppedAnimation(Colors.indigo),
          ),
        ),
      );
    });
  }
}
