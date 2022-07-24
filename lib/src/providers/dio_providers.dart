import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider(
  (ref) => Dio(
    BaseOptions(
      contentType: "application/json",
    ),
  ),
);

// final Reader _read;
// final repositoryProvider = Provider((ref) => ApiRepository(ref.read));
