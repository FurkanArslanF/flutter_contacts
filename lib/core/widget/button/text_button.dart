import 'package:flutter/material.dart';
import 'package:flutter_nexoft/core/contants/color.dart';
import 'package:kartal/kartal.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({super.key, this.onPressed, required this.title, this.color, this.padding = EdgeInsets.zero});
  final void Function()? onPressed;
  final String title;
  final Color? color;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: padding),
      onPressed: onPressed,
      child: Text(
        title,
        style: context.general.textTheme.bodySmall?.copyWith(color: color ?? ColorManager.BLUE),
      ),
    );
  }
}
