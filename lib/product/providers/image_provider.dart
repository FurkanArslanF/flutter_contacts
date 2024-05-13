import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final imageStateProvider = StateNotifierProvider.autoDispose((ref) {
  return ImageStateNotifier();
});

class ImageStateNotifier extends StateNotifier<File> {
  ImageStateNotifier() : super(File(""));

  void notify(File? file) async {
    state = file ?? File("");
  }
}
