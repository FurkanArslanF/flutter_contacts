import 'package:flutter/material.dart';
import 'package:flutter_nexoft/core/contants/color.dart';
import 'package:flutter_nexoft/core/widget/appbar.dart';
import 'package:flutter_nexoft/core/widget/image/img_profile.dart';
import 'package:flutter_nexoft/core/widget/image/no_img.dart';
import 'package:flutter_nexoft/core/widget/modal/modal.dart';
import 'package:flutter_nexoft/features/contacts/widget/no_items.dart';
import 'package:flutter_nexoft/features/contacts/widget/profile.dart';
import 'package:flutter_nexoft/product/model/_global/data.dart';
import 'package:flutter_nexoft/product/providers/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class ContactsView extends ConsumerWidget {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var keyword = ref.watch(searchKeywordState) as String;
    var getUsers = ref.watch(userFutureProvider(keyword));
    return Scaffold(
      backgroundColor: ColorManager.PAGE_COLOR,
      appBar: const ApplicationAppBar(),
      resizeToAvoidBottomInset: false,
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(userFutureProvider);
        },
        child: getUsers.when(
          data: (usersData) {
            return usersData.data?.users.ext.isNullOrEmpty == true ? const Center(child: NoUserItem()) : _UserItem(userData: usersData.data);
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
      ),
    );
  }
}

class _UserItem extends ConsumerWidget {
  const _UserItem({required this.userData});
  final Data? userData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: userData!.users!.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Container(
          height: 17.w,
          margin: EdgeInsets.only(left: 7.w, right: 7.w, top: 3.w),
          decoration: BoxDecoration(
            color: ColorManager.WHITE,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            onTap: () {
              ref.read(userPageState.notifier).notify(userData!.users![index].id);
              appModal(context, Profile(user: userData!.users![index]), useSafeArea: true, isScrollControlled: true);
            },
            leading: userData!.users![index].profileImageUrl == null ? const NoImage(containerSize: 8, iconSize: 5) : ImageProfile(imageUrl: userData!.users![index].profileImageUrl!, containerSize: 8),
            title: Text("${userData!.users![index].firstName} ${userData!.users![index].lastName}"),
            subtitle: Text(userData!.users![index].phoneNumber ?? ''),
          ),
        );
      },
    );
  }
}
