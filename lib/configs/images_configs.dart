import 'package:flutter/widgets.dart';
import 'dart:async';

class ImageConfig {
  final double imageHeight;
  final double imageWidth;
  final String imageUrl;

  ImageConfig._({
    required this.imageHeight,
    required this.imageWidth,
    required this.imageUrl,
  });

  static Future<ImageConfig> create(
      BuildContext context, String imageUrl) async {
    final Size imageSize = await _getImageSize(imageUrl);
    return ImageConfig._(
      imageHeight: imageSize.height,
      imageWidth: imageSize.width,
      imageUrl: imageUrl,
    );
  }

  static Future<Size> _getImageSize(String imageUrl) async {
    final Image image = Image.network(imageUrl);
    final Completer<Size> completer = Completer<Size>();

    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(Size(
          info.image.width.toDouble(),
          info.image.height.toDouble(),
        ));
      }),
    );
    return completer.future;
  }
}
