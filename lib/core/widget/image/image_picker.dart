import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_nexoft/core/contants/color.dart';
import 'package:flutter_nexoft/core/contants/string.dart';
import 'package:flutter_nexoft/core/widget/button/eleveted_button.dart';
import 'package:flutter_nexoft/core/widget/modal/modal.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

Future<File> getImage(BuildContext context) async {
  bool? isCamera = await appModal<bool>(
    context,
    maxHeight: 28,
    Container(
      margin: EdgeInsets.only(top: 10.w),
      height: 50.w,
      width: 100.w,
      child: Column(
        children: [
          AppElevetedButton(
            text: AppStringConst.camera,
            icon: Icons.camera_alt_outlined,
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          context.sized.emptySizedHeightBoxLow,
          AppElevetedButton(
            text: AppStringConst.gallery,
            icon: Icons.image_outlined,
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          context.sized.emptySizedHeightBoxLow,
          AppElevetedButton(
            text: AppStringConst.modalCancelButton,
            textColor: ColorManager.BLUE,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    ),
  );

  XFile? file = await ImagePicker().pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
  return File(file?.path ?? "");
}
