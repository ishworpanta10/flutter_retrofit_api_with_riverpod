import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_retrofit/src/models/failure_model.dart';
import 'package:flutter_retrofit/src/models/models.dart';
import 'package:flutter_retrofit/src/providers/api_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userListProvider = FutureProvider.autoDispose<Either<FailureModel, List<UserModel>>>((ref) async {
  final apiClient = await ref.read(apiClientProvider.future);
  try {
    final userList = await apiClient.getUsers();
    return Right(userList);
  } on DioError catch (err) {
    print('Error getting user list : $err');
    return Left(FailureModel(message: err.message));
  } catch (err) {
    print('Error getting user list : $err');
    return const Left(FailureModel(message: 'Something went wrong getting user data '));
  }
});
