// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_nexoft/core/contants/string.dart';
import 'package:flutter_nexoft/core/widget/image/image_picker.dart';
import 'package:flutter_nexoft/core/widget/loading.dart';
import 'package:flutter_nexoft/core/widget/snackbar/snackbar.dart';
import 'package:flutter_nexoft/features/contacts/widget/add_user.dart';
import 'package:flutter_nexoft/product/model/_global/user.dart';
import 'package:flutter_nexoft/product/providers/image_provider.dart';
import 'package:flutter_nexoft/product/providers/user_provider.dart';
import 'package:flutter_nexoft/product/services/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin AddUserMixin on State<AddUser> {
  File? imageFile;
  late final GlobalKey<FormState> formKey;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController phoneNumberController;
  late final ValueNotifier<bool> isFormValid;
  late final String imgPath;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    firstNameController = TextEditingController(text: widget.user?.firstName);
    lastNameController = TextEditingController(text: widget.user?.lastName);
    phoneNumberController = TextEditingController(text: widget.user?.phoneNumber);
    isFormValid = ValueNotifier(false);
    imgPath = widget.user?.profileImageUrl ?? "";
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    isFormValid.dispose();
    super.dispose();
  }

  void onFormChanged() {
    isFormValid.value = formKey.currentState?.validate() ?? false;
  }

  void onPhoto(WidgetRef ref) async {
    imageFile = await getImage(context);
    ref.read(imageStateProvider.notifier).notify(imageFile);
  }

  void postPutUser(WidgetRef ref) {
    if (widget.user == null) {
      onPostUser(ref);
    } else {
      onPutUser(ref);
    }
  }

  void onPostUser(WidgetRef ref) async {
    if (imageFile != null) {
      appLoading(context, true);
      var imgResponse = await UserApiService.instance.uploadImage(imageFile!);
      if (imgResponse.status == 200 && imgResponse.data != null) {
        var response = await UserApiService.instance.post(User(firstName: firstNameController.text, lastName: lastNameController.text, phoneNumber: phoneNumberController.text, profileImageUrl: imgResponse.data!.imageUrl));
        if (response.status == 200 && response.data != null) {
          appLoading(context, false);
          ref.read(userPageState.notifier).notify(response.data?.id ?? "");
          ref.invalidate(userFutureProvider);
          showSnackBar(context, AppStringConst.userAdded);
        }
      }
    } else {
      appLoading(context, true);
      var response = await UserApiService.instance.post(User(firstName: firstNameController.text, lastName: lastNameController.text, phoneNumber: phoneNumberController.text, profileImageUrl: null));
      if (response.status == 200 && response.data != null) {
        appLoading(context, false);
        ref.read(userPageState.notifier).notify(response.data?.id ?? "");
        ref.invalidate(userFutureProvider);
        showSnackBar(context, AppStringConst.userAdded);
      }
    }
  }

  void onPutUser(WidgetRef ref) async {
    if (imageFile != null) {
      appLoading(context, true);
      var imgResponse = await UserApiService.instance.uploadImage(imageFile!);
      if (imgResponse.status == 200 && imgResponse.data != null) {
        var response = await UserApiService.instance.put(widget.user?.id ?? "", User(firstName: firstNameController.text, lastName: lastNameController.text, phoneNumber: phoneNumberController.text, profileImageUrl: imgResponse.data!.imageUrl));
        if (response.status == 200 && response.data != null) {
          appLoading(context, false);
          ref.invalidate(userByIdFutureProvider);
          ref.read(userPageState.notifier).notify(response.data?.id ?? "");
          ref.invalidate(userFutureProvider);
          showSnackBar(context, AppStringConst.userUpdated);
        }
      }
    } else {
      appLoading(context, true);
      var response = await UserApiService.instance.put(widget.user?.id ?? "", User(firstName: firstNameController.text, lastName: lastNameController.text, phoneNumber: phoneNumberController.text, profileImageUrl: null));
      if (response.status == 200 && response.data != null) {
        appLoading(context, false);
        ref.invalidate(userByIdFutureProvider);
        ref.read(userPageState.notifier).notify(response.data?.id ?? "");
        ref.invalidate(userFutureProvider);
        showSnackBar(context, AppStringConst.userUpdated);
      }
    }
  }
}
