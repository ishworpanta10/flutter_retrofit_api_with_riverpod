import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_retrofit/src/models/models.dart';
import 'package:flutter_retrofit/src/repositories/api_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userListProvider = FutureProvider.autoDispose<Either<FailureModel, List<UserModel>>>((ref) async {
  final apiRepository = await ref.read(apiRepositoryProvider.future);
  return apiRepository.getUsers();
});

final singleUserProvider = FutureProvider.autoDispose.family<Either<FailureModel, UserModel>, String>((ref, userId) async {
  final apiRepository = await ref.read(apiRepositoryProvider.future);
  return apiRepository.getSingleUsers(userId: userId);
});

final commentListProvider =
    FutureProvider.autoDispose.family<Either<FailureModel, List<CommentModel>>, String>((ref, postId) async {
  final apiRepository = await ref.read(apiRepositoryProvider.future);
  return apiRepository.getPostComments(postId: postId);
});

final commentListWithQueriesProvider =
    FutureProvider.autoDispose.family<Either<FailureModel, List<CommentModel>>, CommentRequestQuery>((ref, postQuery) async {
  final apiRepository = await ref.read(apiRepositoryProvider.future);
  return apiRepository.getPostCommentsWithQueryMap(postQueries: postQuery.toMap());
});

final createUserProvider = FutureProvider.family<Either<FailureModel, UserModel>, UserModel>((ref, userModel) async {
  final apiRepository = await ref.read(apiRepositoryProvider.future);
  return apiRepository.createUser(userModel: userModel);
});

final updateUserProvider =
    FutureProvider.family<Either<FailureModel, UserModel>, UserModelWithId>((ref, userModelWithUserId) async {
  final apiRepository = await ref.read(apiRepositoryProvider.future);
  return apiRepository.updateUser(
    userId: userModelWithUserId.userId,
    userModel: userModelWithUserId.userModel,
  );
});

final deleteUserProvider = FutureProvider.family<Either<FailureModel, bool>, int>((ref, userId) async {
  final apiRepository = await ref.read(apiRepositoryProvider.future);
  return apiRepository.deleteUser(userId: userId);
});

/////***********************Request Model *******************************////////////////
class UserModelWithId extends Equatable {
  final UserModel userModel;
  final String userId;

  const UserModelWithId({
    required this.userModel,
    required this.userId,
  });

  @override
  List<Object> get props => [userModel, userId];
}

class CommentRequestQuery extends Equatable {
  final String postId;
  final String email;

  const CommentRequestQuery({
    required this.postId,
    required this.email,
  });

  @override
  List<Object> get props => [postId, email];

  Map<String, dynamic> toMap() {
    return {
      'post_id': postId,
      'email': email,
    };
  }
}
