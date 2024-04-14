import 'package:flutter/material.dart';

import 'package:twitter_embed_card/constant/svg_asset.dart';
import 'package:twitter_embed_card/present/component/svg_icon.dart';

class TweetActions extends StatelessWidget {
  const TweetActions({
    required this.likesCount,
    super.key,
  });

  final int likesCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton.icon(
          onPressed: () {},
          icon: const SvgIcon(asset: SvgAsset.heartRed),
          label: Text(likesCount.toString()),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const SvgIcon(asset: SvgAsset.comment),
          label: const Text('Reply'),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const SvgIcon(asset: SvgAsset.link),
          label: const Text('Copy link'),
        ),
      ],
    );
  }
}
