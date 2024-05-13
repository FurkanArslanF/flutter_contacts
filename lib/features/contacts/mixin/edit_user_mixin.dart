// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_nexoft/core/contants/color.dart';
import 'package:flutter_nexoft/core/contants/string.dart';
import 'package:flutter_nexoft/core/widget/button/eleveted_button.dart';
import 'package:flutter_nexoft/core/widget/loading.dart';
import 'package:flutter_nexoft/core/widget/modal/modal.dart';
import 'package:flutter_nexoft/core/widget/snackbar/snackbar.dart';
import 'package:flutter_nexoft/features/contacts/widget/edit_user.dart';
import 'package:flutter_nexoft/product/providers/image_provider.dart';
import 'package:flutter_nexoft/product/providers/user_provider.dart';
import 'package:flutter_nexoft/product/services/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

mixin EditUserMixin on ConsumerState<EditUser> {
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController phoneNumberController;
  String imgPath = "";

  @override
  void initState() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  void onEditButtonPressed() {
    ref.read(imageStateProvider.notifier).notify(File(imgPath));
    ref.read(userPageState.notifier).notify(null);
  }

  void onDeletedUser(WidgetRef ref) async {
    await appModal(
      context,
      maxHeight: 28,
      Container(
        margin: EdgeInsets.only(top: 10.w),
        height: 50.w,
        width: 100.w,
        child: Column(
          children: [
            Text(AppStringConst.isDeleteAccount, style: context.general.textTheme.titleLarge?.copyWith(color: ColorManager.RED)),
            context.sized.emptySizedHeightBoxLow3x,
            AppElevetedButton(
              text: AppStringConst.yes,
              onPressed: () async {
                appLoading(context, true);
                var isEditPage = ref.watch(userPageState) as String;
                var response = await UserApiService.instance.delete(isEditPage);
                if (response.status == 200 && response.data != null) {
                  appLoading(context, false);
                  ref.invalidate(userFutureProvider);
                  Navigator.of(context)
                    ..pop()
                    ..pop();
                  showSnackBar(context, AppStringConst.accountDeleted);
                }
              },
            ),
            context.sized.emptySizedHeightBoxLow,
            AppElevetedButton(
              text: AppStringConst.no,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
