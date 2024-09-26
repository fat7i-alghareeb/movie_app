import 'package:movie_app/utils/extensions.dart';
import '../../constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.77,
      child: Card(
        elevation: 2,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.kBorderRadius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Constants.kBorderRadius),
          child: CachedNetworkImage(
            imageUrl: image,
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              color: Colors.red,
            ),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
                color: context.accentColor(),
              ),
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
