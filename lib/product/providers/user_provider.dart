import 'package:flutter_nexoft/product/model/get_user_response.dart';
import 'package:flutter_nexoft/product/model/response.dart';
import 'package:flutter_nexoft/product/services/user.dart';
import 'package:riverpod/riverpod.dart';

final userFutureProvider = FutureProvider.family<GetUserResponseModel, String?>(
  (ref, search) async {
    return UserApiService.instance.get(search: search);
  },
);

final userByIdFutureProvider = FutureProvider.family<BaseResponseModel, String>((ref, userId) async {
  return UserApiService.instance.getById(id: userId);
});

final searchKeywordState = StateNotifierProvider((ref) {
  return SearchKeywordStateNotifier();
});

class SearchKeywordStateNotifier extends StateNotifier<String> {
  SearchKeywordStateNotifier() : super("");

  void notify(String search) async {
    state = search;
  }
}

final userPageState = StateNotifierProvider((ref) {
  return UserPageStateNotifier();
});

class UserPageStateNotifier extends StateNotifier<String?> {
  UserPageStateNotifier() : super(null);

  void notify(String? userId) async {
    state = userId;
  }
}
