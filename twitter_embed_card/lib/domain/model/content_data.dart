abstract class ContentData {}

class TextContentData implements ContentData {
  const TextContentData(this.text);

  final String text;
}

class ImageContentData implements ContentData {
  const ImageContentData(this.imageName);

  final String imageName;
}
