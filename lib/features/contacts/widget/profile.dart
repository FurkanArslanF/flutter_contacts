import 'package:flutter/material.dart';
import 'package:flutter_nexoft/features/contacts/widget/add_user.dart';
import 'package:flutter_nexoft/features/contacts/widget/edit_user.dart';
import 'package:flutter_nexoft/product/model/_global/user.dart';
import 'package:flutter_nexoft/product/providers/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key, this.user});
  final User? user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var pageState = ref.watch(userPageState);
    return pageState == null ? AddUser(user: user) : const EditUser();
  }
}
