import 'package:flutter/material.dart';
import 'package:flutter_nexoft/core/contants/color.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: ColorManager.WHITE,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      content: Padding(
        padding: context.padding.onlyTopNormal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("assets/snackbar.png", width: 7.w, height: 7.w),
            context.sized.emptySizedWidthBoxLow3x,
            Text(message, style: context.general.textTheme.bodySmall?.copyWith(color: ColorManager.GREEN)),
          ],
        ),
      ),
    ),
  );
}
