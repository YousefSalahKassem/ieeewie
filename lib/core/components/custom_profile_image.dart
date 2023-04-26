import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ieeewie/core/themes/color.dart';

class CustomProfileImage extends StatelessWidget {
  final String? imageUrl;
  final double radius;
  final bool isAsset;

  const CustomProfileImage({
    this.imageUrl,
    required this.radius,
    this.isAsset = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isAsset) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: AppColors.secondaryColor,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Image.asset(
            imageUrl!,
            fit: BoxFit.cover,
            color: Colors.white,
          ),
        ),
      );
    }
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        backgroundColor: AppColors.secondaryColor,
        radius: radius,
        backgroundImage: imageProvider,
      ),
      placeholder: (context, url) => CircleAvatar(
        backgroundColor: AppColors.secondaryColor,
        radius: radius,
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
      errorWidget: (context, url, error) => CircleAvatar(
        backgroundColor: AppColors.secondaryColor,
        radius: radius,
        child: const Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
    );
  }
}
