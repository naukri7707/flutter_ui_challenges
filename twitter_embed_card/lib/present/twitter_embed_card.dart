import 'package:flutter/material.dart';

import 'package:twitter_embed_card/domain/model/tweet_data.dart';
import 'package:twitter_embed_card/present/component/tweet_actions.dart';
import 'package:twitter_embed_card/present/component/tweet_content.dart';
import 'package:twitter_embed_card/present/component/tweet_header.dart';
import 'package:twitter_embed_card/present/component/tweet_metadata.dart';
import 'package:twitter_embed_card/present/component/tweet_read_replies_button.dart';

class TwitterEmbedCard extends StatelessWidget {
  const TwitterEmbedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TweetHeader(
          avatarImageName: 'assets/andrea-avatar.png',
          nickname: tweetData.nickname,
          username: tweetData.username,
        ),
        for (final content in tweetData.contents) TweetContent.create(content),
        TweetMetadata(tweetData.dateTime),
        const Divider(),
        TweetActions(
          likesCount: tweetData.likesCount,
        ),
        const SizedBox(height: 6),
        TweetReadRepliesButton(repliesCount: tweetData.repliesCount),
      ],
    );
  }
}
