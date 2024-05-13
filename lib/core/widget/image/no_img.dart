import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NoImage extends StatelessWidget {
  const NoImage({super.key, this.containerSize = 15, this.iconSize = 13});
  final double containerSize;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerSize.w,
      width: containerSize.w,
      decoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
      child: Icon(Icons.person, size: iconSize.w, color: Colors.white),
    );
  }
}
