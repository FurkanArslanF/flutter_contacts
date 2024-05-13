import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_nexoft/core/contants/color.dart';
import 'package:flutter_nexoft/core/contants/string.dart';
import 'package:flutter_nexoft/core/widget/image/img_profile.dart';
import 'package:flutter_nexoft/core/widget/image/no_img.dart';
import 'package:flutter_nexoft/core/widget/button/text_button.dart';
import 'package:flutter_nexoft/core/widget/textfield/textfield.dart';
import 'package:flutter_nexoft/features/contacts/mixin/add_user_mixin.dart';
import 'package:flutter_nexoft/features/contacts/widget/top_bar.dart';
import 'package:flutter_nexoft/product/model/_global/user.dart';
import 'package:flutter_nexoft/product/providers/image_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';

class AddUser extends ConsumerStatefulWidget {
  const AddUser({super.key, this.user});
  final User? user;

  @override
  ConsumerState<AddUser> createState() => _AddUserState();
}

class _AddUserState extends ConsumerState<AddUser> with AddUserMixin {
  @override
  Widget build(BuildContext context) {
    var image = ref.watch(imageStateProvider) as File;
    return SingleChildScrollView(
      child: Column(
        children: [
          TopBar(title: AppStringConst.modalDoneButton, isFormValid: isFormValid, onPressed: () => postPutUser(ref)),
          context.sized.emptySizedHeightBoxLow3x,
          image.path.ext.isNotNullOrNoEmpty
              ? ImageProfile(imageUrl: image.path)
              : imgPath.ext.isNotNullOrNoEmpty
                  ? ImageProfile(imageUrl: imgPath)
                  : const NoImage(containerSize: 40, iconSize: 26),
          context.sized.emptySizedHeightBoxLow,
          AppTextButton(
              title: image.path.ext.isNotNullOrNoEmpty
                  ? AppStringConst.changePhoto
                  : imgPath.ext.isNotNullOrNoEmpty
                      ? AppStringConst.changePhoto
                      : AppStringConst.addPhoto,
              onPressed: () => onPhoto(ref),
              color: ColorManager.BLACK),
          context.sized.emptySizedHeightBoxLow,
          Form(
            key: formKey,
            onChanged: onFormChanged,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextField(hintText: AppStringConst.firstName, controller: firstNameController, keyboardType: TextInputType.text, textInputAction: TextInputAction.next),
                context.sized.emptySizedHeightBoxLow,
                AppTextField(hintText: AppStringConst.lastName, controller: lastNameController, keyboardType: TextInputType.text, textInputAction: TextInputAction.next),
                context.sized.emptySizedHeightBoxLow,
                AppTextField(hintText: AppStringConst.phoneNumber, controller: phoneNumberController, keyboardType: TextInputType.phone, textInputAction: TextInputAction.done),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
