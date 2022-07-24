import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedUserProvider = StateProvider<String?>((ref) {
  return null;
});

final selectedPostProvider = StateProvider<String?>((ref) {
  return null;
});

final getPostCommentActive = StateProvider<bool>((ref) {
  return false;
});
