import 'package:flutter/material.dart';
import 'package:flutter_nexoft/core/contants/color.dart';
import 'package:flutter_nexoft/core/contants/string.dart';
import 'package:flutter_nexoft/core/widget/button/text_button.dart';
import 'package:kartal/kartal.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, this.isFormValid, this.onPressed, required this.title, this.isEdit = false});
  final String title;
  final ValueNotifier<bool>? isFormValid;
  final void Function()? onPressed;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopNormal + context.padding.horizontalNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppTextButton(title: AppStringConst.modalCancelButton, onPressed: () => Navigator.pop(context)),
          Text(!isEdit ? AppStringConst.newContact : "", style: context.general.textTheme.bodySmall),
          ValueListenableBuilder<bool>(
            valueListenable: isFormValid ?? ValueNotifier(true),
            builder: (context, value, child) {
              return AppTextButton(title: title, onPressed: !value ? null : onPressed, color: value ? ColorManager.BLUE : ColorManager.GREY);
            },
          ),
        ],
      ),
    );
  }
}
