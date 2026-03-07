import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sonora/global/utils/widgets/skeleton.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxReference heightRef;
  final double borderRadius;
  final BoxFit fit;
  final BoxShape shape;

  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.borderRadius = 8.0,
    this.fit = BoxFit.cover,
    this.shape = BoxShape.rectangle,
    this.heightRef = const BoxReference(),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: shape,
        borderRadius: shape == BoxShape.circle ? null : BorderRadius.circular(borderRadius),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
        fit: fit,
        placeholder: (context, url) => Skeleton(
          height: height,
          width: width,
          borderRadius: borderRadius,
        ),
        errorWidget: (context, url, error) => Container(
          height: height,
          width: width,
          color: Colors.grey[900],
          child: const Icon(Icons.error_outline, color: Colors.white24),
        ),
        fadeInDuration: const Duration(milliseconds: 500),
      ),
    );
  }
}

class BoxReference {
  const BoxReference();
}
