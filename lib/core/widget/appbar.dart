// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_nexoft/core/contants/color.dart';
import 'package:flutter_nexoft/core/contants/string.dart';
import 'package:flutter_nexoft/core/widget/modal/modal.dart';
import 'package:flutter_nexoft/core/widget/textfield/search.dart';
import 'package:flutter_nexoft/features/contacts/widget/profile.dart';
import 'package:flutter_nexoft/product/providers/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

class ApplicationAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ApplicationAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: ColorManager.PAGE_COLOR,
      title:  const Text(AppStringConst.appBarTitle),
      titleSpacing: 7.w,
      titleTextStyle: Theme.of(context).textTheme.titleLarge,
      centerTitle: false,
      actions: [
        // _AppBarAddButton(),
        _appBarAddButton(ref, context),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10.w),
        child: AppSearch(
          onChanged: (value) {
            ref.read(searchKeywordState.notifier).notify(value);
          },
        ),
      ),
    );
  }

  Container _appBarAddButton(WidgetRef ref, BuildContext context) {
    return Container(
      height: 6.w,
      width: 6.w,
      margin: EdgeInsets.only(right: 7.w),
      decoration: BoxDecoration(
        color: ColorManager.BLUE,
        borderRadius: BorderRadius.circular(30),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        color: ColorManager.WHITE,
        icon: const Icon(Icons.add),
        onPressed: () {
          ref.read(userPageState.notifier).notify(null);
          appModal(context, const Profile(), useSafeArea: true, isScrollControlled: true);
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 10.w);
}
