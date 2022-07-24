import 'package:dio/dio.dart';
import 'package:flutter_retrofit/src/models/models.dart';
import 'package:flutter_retrofit/src/screens/pagination/models/post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final paginationDioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));
});

final paginationServiceProvider = Provider<PaginationService>((ref) {
  final dio = ref.read(paginationDioProvider);
  return PaginationService(dio: dio);
});

class PaginationService {
  final Dio dio;

  const PaginationService({required this.dio});

  Future<List<PostModel>?> getPaginatedPostList({int page = 1, int limit = 10}) async {
    try {
      final response = await dio.get('posts?_page=$page&_limit=$limit');
      final dataList = response.data as List<dynamic>;
      return dataList.map((e) => PostModel.fromMap(e)).toList();
    } catch (err) {
      print("Paginated Error on Post :$err");
      return null;
    }
  }

  Future<List<UserModel>?> getPaginatedUserList({int page = 1, int limit = 10}) async {
    try {
      final response = await dio.get('users?_page=$page&_limit=$limit');
      final dataList = response.data as List<dynamic>;
      return dataList.map((e) => UserModel.fromJson(e)).toList();
    } catch (err) {
      print("Paginated Error on User:$err");
      return null;
    }
  }
}
