import 'package:flutter/material.dart';
import 'package:flutter_nexoft/core/contants/color.dart';
import 'package:flutter_nexoft/core/contants/string.dart';
import 'package:flutter_nexoft/core/widget/image/img_profile.dart';
import 'package:flutter_nexoft/core/widget/button/text_button.dart';
import 'package:flutter_nexoft/core/widget/textfield/textfield.dart';
import 'package:flutter_nexoft/features/contacts/mixin/edit_user_mixin.dart';
import 'package:flutter_nexoft/features/contacts/widget/top_bar.dart';
import 'package:flutter_nexoft/product/model/_global/user.dart';
import 'package:flutter_nexoft/product/providers/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class EditUser extends ConsumerStatefulWidget {
  const EditUser({super.key, this.user});
  final User? user;

  @override
  ConsumerState<EditUser> createState() => _EditUserState();
}

class _EditUserState extends ConsumerState<EditUser> with EditUserMixin {
  @override
  Widget build(BuildContext context) {
    var isEditPage = ref.watch(userPageState) as String;
    var userDataProvider = ref.watch(userByIdFutureProvider(isEditPage));
    return SingleChildScrollView(
      child: userDataProvider.when(
        data: (userData) {
          firstNameController.text = userData.data?.firstName ?? "";
          lastNameController.text = userData.data?.lastName ?? "";
          phoneNumberController.text = userData.data?.phoneNumber ?? "";
          imgPath = userData.data?.profileImageUrl ?? "";
          return Column(
            children: [
              TopBar(title: AppStringConst.edit, onPressed: () => onEditButtonPressed(), isEdit: true),
              context.sized.emptySizedHeightBoxLow3x,
              ImageProfile(imageUrl: userData.data?.profileImageUrl ?? ""),
              context.sized.emptySizedHeightBoxLow,
              AppTextButton(title: AppStringConst.changePhoto, onPressed: () => onEditButtonPressed(), color: ColorManager.BLACK),
              context.sized.emptySizedHeightBoxLow,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextField(hintText: AppStringConst.firstName, controller: firstNameController, isBorder: false, enabled: false),
                  context.sized.emptySizedHeightBoxLow,
                  AppTextField(hintText: AppStringConst.lastName, controller: lastNameController, isBorder: false, enabled: false),
                  context.sized.emptySizedHeightBoxLow,
                  AppTextField(hintText: AppStringConst.phoneNumber, controller: phoneNumberController, isBorder: false, enabled: false),
                  context.sized.emptySizedHeightBoxLow,
                  AppTextButton(title: AppStringConst.deleteContact, padding: EdgeInsets.only(left: 6.w), color: ColorManager.RED, onPressed: () => onDeletedUser(ref)),
                ],
              ),
            ],
          );
        },
        error: (object, error) {
          return Center(
            child: Text('Error: $error'),
          );
        },
        loading: () {
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
