import 'package:flutter/material.dart';
import 'package:flutter_nexoft/core/contants/color.dart';
import 'package:sizer/sizer.dart';

Future<T> appModal<T>(BuildContext context, Widget child, {bool? isScrollControlled, bool? useSafeArea, double? maxHeight}) async {
  return await showModalBottomSheet(
    isScrollControlled: isScrollControlled ?? false,
    backgroundColor: ColorManager.WHITE,
    useSafeArea: useSafeArea ?? false,
    constraints: BoxConstraints(
      minHeight: 0,
      maxHeight: (maxHeight ?? 93).h,
    ),
    context: context,
    builder: (contextModal) => ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: child,
      ),
    ),
  );
}
