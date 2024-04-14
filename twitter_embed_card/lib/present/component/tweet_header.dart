import 'package:flutter/material.dart';

import 'package:twitter_embed_card/constant/svg_asset.dart';
import 'package:twitter_embed_card/present/component/svg_icon.dart';

class TweetHeader extends StatelessWidget {
  const TweetHeader({
    super.key,
    required this.avatarImageName,
    required this.nickname,
    required this.username,
  });

  final String avatarImageName;

  final String nickname;

  final String username;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(avatarImageName),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    nickname,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: 4.0),
                  const SvgIcon(asset: SvgAsset.heartBlue, width: 18),
                  const SizedBox(width: 4.0),
                  const SvgIcon(asset: SvgAsset.verified, width: 18),
                ],
              ),
              const SizedBox(height: 2.0),
              const Row(
                children: [
                  Text(
                    '@biz84',
                    style: TextStyle(
                      color: Color(0xFF566370),
                    ),
                  ),
                  Text(
                    '·',
                    style: TextStyle(
                      color: Color(0xFF566370),
                    ),
                  ),
                  Text(
                    'Follow',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2E6ECF),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: const SvgIcon(
              asset: SvgAsset.x,
            ))
      ],
    );
  }
}
