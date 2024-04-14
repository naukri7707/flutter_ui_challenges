import 'package:flutter/material.dart';

class TweetReadRepliesButton extends StatelessWidget {
  const TweetReadRepliesButton({super.key, required this.repliesCount});

  final int repliesCount;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Text('Read $repliesCount replies'),
    );
  }
}
