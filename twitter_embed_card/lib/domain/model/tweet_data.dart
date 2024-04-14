import 'package:twitter_embed_card/domain/model/content_data.dart';

class TweetData {
  const TweetData({
    required this.nickname,
    required this.username,
    required this.contents,
    required this.dateTime,
    required this.likesCount,
    required this.repliesCount,
  });
  final String nickname;
  final String username;
  final List<ContentData> contents;
  final DateTime dateTime;
  final int likesCount;
  final int repliesCount;
}

final tweetData = TweetData(
  nickname: 'Andrea Bizzotto',
  username: '@biz84',
  contents: [
    const TextContentData('''
Did you know?

When you call `MediaQuery.of(context)` inside a build method, the widget will rebuild when *any* of the MediaQuery properties change.

But there's a better way that lets you depend only on the properties you care about (and minimize unnecessary rebuilds). 👇
'''),
    const ImageContentData('assets/media-query-banner.jpg'),
  ],
  dateTime: DateTime.parse('2023-07-20 10:21:00'),
  likesCount: 997,
  repliesCount: 12,
);
