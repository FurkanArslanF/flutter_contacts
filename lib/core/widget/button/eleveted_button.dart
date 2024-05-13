import 'package:flutter/material.dart';
import 'package:flutter_nexoft/core/contants/color.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class AppElevetedButton extends StatelessWidget {
  const AppElevetedButton({super.key, required this.text, this.onPressed, this.icon, this.textColor = ColorManager.BLACK});
  final String text;
  final void Function()? onPressed;
  final IconData? icon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.PAGE_COLOR,
            foregroundColor: ColorManager.PAGE_COLOR,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            side: const BorderSide(color: ColorManager.PAGE_COLOR, width: 1),
            elevation: 2,
            minimumSize: Size(80.w, 10.w),
          ),
          onPressed: onPressed,
          child: Row(
            children: [
              icon != null
                  ? Icon(
                      icon,
                      color: ColorManager.BLACK,
                      size: 7.w,
                    )
                  : const SizedBox.shrink(),
              icon != null ? context.sized.emptySizedWidthBoxLow3x : const SizedBox.shrink(),
              Text(text, style: context.general.textTheme.titleLarge?.copyWith(color: textColor)),
            ],
          ),
        ),
      ],
    );
  }
}
