import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nexoft/core/contants/string.dart';
import 'package:flutter_nexoft/core/widget/image/no_img.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key, this.containerSize = 40.0, this.imageUrl});
  final double containerSize;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize.w,
      height: containerSize.w,
      decoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(containerSize.w),
        child: imageUrl.ext.isNullOrEmpty
            ? const NoImage(containerSize: 40, iconSize: 26)
            : imageUrl?.contains(AppStringConst.baseUrl) == false
                ? Image.file(File(imageUrl!), fit: BoxFit.cover)
                : CachedNetworkImage(
                    imageUrl: imageUrl ?? '',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
      ),
    );
  }
}
