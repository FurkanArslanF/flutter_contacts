import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nexoft/core/contants/string.dart';
import 'package:flutter_nexoft/core/widget/modal/modal.dart';
import 'package:flutter_nexoft/core/widget/image/no_img.dart';
import 'package:flutter_nexoft/core/widget/button/text_button.dart';
import 'package:flutter_nexoft/features/contacts/widget/profile.dart';
import 'package:flutter_nexoft/product/providers/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';

class NoUserItem extends ConsumerWidget {
  const NoUserItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const NoImage(),
        context.sized.emptySizedHeightBoxLow,
        Text(AppStringConst.noContacts, style: context.general.textTheme.titleLarge),
        context.sized.emptySizedHeightBoxLow,
        Text(AppStringConst.contactsYouveAdded, style: context.general.textTheme.bodySmall),
        AppTextButton(
          title: AppStringConst.createNewContact,
          onPressed: () {
            ref.read(userPageState.notifier).notify(null);
            appModal(context, const Profile(), useSafeArea: true, isScrollControlled: true);
          },
        ),
      ],
    );
  }
}
