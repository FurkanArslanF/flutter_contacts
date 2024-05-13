import 'package:flutter/material.dart';
import 'package:flutter_nexoft/core/contants/color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';

class AppTextField extends ConsumerWidget {
  const AppTextField({super.key, this.controller, this.hintText, this.keyboardType, this.textInputAction, this.isBorder = true, this.enabled = true});
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool isBorder;
  final bool enabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: context.padding.horizontalNormal,
      child: TextFormField(
        enabled: enabled,
        controller: controller,
        style: context.general.textTheme.bodySmall,
        textInputAction: textInputAction,
        validator: (value) => value!.isEmpty ? "" : null,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          errorStyle: context.general.textTheme.bodySmall!.copyWith(fontSize: 0),
          contentPadding: context.padding.onlyLeftNormal,
          hintText: hintText,
          filled: isBorder ? true : false,
          fillColor: ColorManager.PAGE_COLOR,
          border: isBorder ? const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)), borderSide: BorderSide(color: ColorManager.BLACK)) : null,
          focusedBorder: isBorder ? const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)), borderSide: BorderSide(color: ColorManager.BLACK)) : null,
          enabledBorder: isBorder ? const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)), borderSide: BorderSide(color: ColorManager.BLACK)) : null,
          errorBorder: isBorder ? const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)), borderSide: BorderSide(color: ColorManager.BLACK)) : null,
          focusedErrorBorder: isBorder ? const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)), borderSide: BorderSide(color: ColorManager.BLACK)) : null,
        ),
      ),
    );
  }
}
