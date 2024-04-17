import 'package:flutter/material.dart';

class RemainingTimeText extends StatelessWidget {
  const RemainingTimeText({
    super.key,
    required this.remainingTime,
  });

  final Duration remainingTime;

  @override
  Widget build(BuildContext context) {
    // 加上 999ms 使其顯示效果從無條件捨去變為無條件進位
    // 這能讓首個倒數的數字能顯示完整的一秒而非一閃而過並只在 remainingTime 完全歸零時才顯示 0
    final visualRemainingTime =
        remainingTime + const Duration(milliseconds: 999);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Text(
          visualRemainingTime.inSeconds.toString(),
          style: TextStyle(
            fontSize: constraints.maxWidth / 2,
            color: Colors.deepPurple,
          ),
        );
      },
    );
  }
}
