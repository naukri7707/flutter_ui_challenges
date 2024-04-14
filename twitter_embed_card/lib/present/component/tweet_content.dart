import 'package:flutter/material.dart';

import 'package:twitter_embed_card/domain/model/content_data.dart';

abstract class TweetContent<TContentData extends ContentData>
    extends StatelessWidget {
  const TweetContent({required this.contentData, super.key});

  final TContentData contentData;

  static TweetContent create(ContentData contentData) {
    switch (contentData) {
      case TextContentData textContentData:
        return TextTweetContent(contentData: textContentData);
      case ImageContentData imageContentData:
        return ImageTweetContent(contentData: imageContentData);
      default:
        throw Exception('Not support data');
    }
  }
}

class TextTweetContent extends TweetContent<TextContentData> {
  const TextTweetContent({required super.contentData, super.key});

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      contentData.text,
      style: const TextStyle(
        fontSize: 18,
        height: 1.25,
      ),
    );
  }
}

class ImageTweetContent extends TweetContent<ImageContentData> {
  const ImageTweetContent({required super.contentData, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: Image.asset(contentData.imageName),
    );
  }
}
