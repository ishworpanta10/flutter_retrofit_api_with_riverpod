import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_retrofit/src/client/api_client.dart';
import 'package:flutter_retrofit/src/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/api_provider.dart';

abstract class IApiRepository {
  ///********** GET APIs **********///
  Future<Either<FailureModel, List<UserModel>>> getUsers();
  Future<Either<FailureModel, UserModel>> getSingleUsers({required String userId});
  Future<Either<FailureModel, List<CommentModel>>> getPostComments({required String postId});
  Future<Either<FailureModel, List<CommentModel>>> getPostCommentsWithQueryMap({required Map<String, dynamic> postQueries});

  ///********** POST APIs **********///
  Future<Either<FailureModel, UserModel>> createUser({required UserModel userModel});

  ///********** PUT APIs **********///
  Future<Either<FailureModel, UserModel>> updateUser({required String userId, required UserModel userModel});

  ///********** DELETE APIs **********///
  Future<Either<FailureModel, bool>> deleteUser({required int userId});

  ///********** PATCH APIs **********///
}

class ApiRepository extends IApiRepository {
  final ApiClient apiClient;

  ApiRepository({required this.apiClient});

  @override
  Future<Either<FailureModel, List<UserModel>>> getUsers() async {
    try {
      final userList = await apiClient.getUsers();
      return Right(userList);
    } on DioError catch (err) {
      return Left(FailureModel(
        statusMessage: err.response?.statusMessage,
        message: err.message,
        code: err.response?.statusCode,
      ));
    } catch (err) {
      return left(const FailureModel(statusMessage: 'Error getting user list '));
    }
  }

  @override
  Future<Either<FailureModel, UserModel>> getSingleUsers({required String userId}) async {
    try {
      final userModel = await apiClient.getSingleUsers(userId);
      return Right(userModel);
    } on DioError catch (err) {
      return Left(FailureModel(
        statusMessage: err.response?.statusMessage,
        message: err.message,
        code: err.response?.statusCode,
      ));
    } catch (err) {
      return left(FailureModel(statusMessage: 'Error getting single user of $userId'));
    }
  }

  @override
  Future<Either<FailureModel, List<CommentModel>>> getPostComments({required String postId}) async {
    try {
      final commentList = await apiClient.getPostComments(postId);
      return Right(commentList);
    } on DioError catch (err) {
      return Left(FailureModel(
        statusMessage: err.response?.statusMessage,
        message: err.message,
        code: err.response?.statusCode,
      ));
    } catch (err) {
      return left(const FailureModel(statusMessage: 'Error getting post comment list with id'));
    }
  }

  @override
  Future<Either<FailureModel, List<CommentModel>>> getPostCommentsWithQueryMap({
    required Map<String, dynamic> postQueries,
  }) async {
    try {
      final commentList = await apiClient.getPostCommentsWithQueryMap(postQueries);
      return Right(commentList);
    } on DioError catch (err) {
      return Left(FailureModel(
        statusMessage: err.response?.statusMessage,
        message: err.message,
        code: err.response?.statusCode,
      ));
    } catch (err) {
      return left(const FailureModel(statusMessage: 'Error getting comment post list with query map data'));
    }
  }

  @override
  Future<Either<FailureModel, UserModel>> createUser({required UserModel userModel}) async {
    try {
      final createdUserModel = await apiClient.createUser(userModel);
      return Right(createdUserModel);
    } on DioError catch (err) {
      return Left(FailureModel(
        statusMessage: err.response?.statusMessage,
        message: err.message,
        code: err.response?.statusCode,
      ));
    } catch (err) {
      return left(const FailureModel(statusMessage: 'Error creating user model'));
    }
  }

  @override
  Future<Either<FailureModel, UserModel>> updateUser({required String userId, required UserModel userModel}) async {
    try {
      final updatedUserModel = await apiClient.updateUser(userId, userModel);
      return Right(updatedUserModel);
    } on DioError catch (err) {
      return Left(FailureModel(
        statusMessage: err.response?.statusMessage,
        message: err.message,
        code: err.response?.statusCode,
      ));
    } catch (err) {
      return left(const FailureModel(statusMessage: 'Error updating user model'));
    }
  }

  @override
  Future<Either<FailureModel, bool>> deleteUser({required int userId}) async {
    try {
      await apiClient.deleteUser(userId);
      return const Right(true);
    } on DioError catch (err) {
      return Left(FailureModel(
        statusMessage: err.response?.statusMessage,
        message: err.message,
        code: err.response?.statusCode,
      ));
    } catch (err) {
      return left(const FailureModel(statusMessage: 'Error deleting user model'));
    }
  }
}

final apiRepositoryProvider = FutureProvider<ApiRepository>((ref) async {
  final apiClient = await ref.watch(apiClientProvider.future);
  return ApiRepository(apiClient: apiClient);
});
