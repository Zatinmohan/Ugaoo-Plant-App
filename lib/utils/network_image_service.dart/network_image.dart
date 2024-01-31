import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ugaoo/gen/assets.gen.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;
  final Alignment? alignment;
  final FilterQuality? quality;
  final double? width;
  final double? height;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  final Widget Function(BuildContext, String, dynamic)? errorWidget;
  final Widget Function(BuildContext, String, DownloadProgress)?
      progressIndicatorBuilder;
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit,
    this.alignment,
    this.quality,
    this.width,
    this.height,
    this.imageBuilder,
    this.errorWidget,
    this.progressIndicatorBuilder,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CachedNetworkImage(
          imageUrl: imageUrl,
          fit: fit ?? BoxFit.fill,
          alignment: alignment ?? Alignment.center,
          filterQuality: quality ?? FilterQuality.medium,
          placeholder: (context, url) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: placeholder != null
                  ? placeholder!(context, url)
                  : Image.asset(Assets.misc.appIcon.path),
            );
          },
          imageBuilder: imageBuilder,
          errorWidget: (context, url, error) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: errorWidget != null
                  ? errorWidget!(context, url, error)
                  : Image.asset(Assets.misc.appIcon.path),
            );
          },
          progressIndicatorBuilder: progressIndicatorBuilder,
        );
      },
    );
  }
}
