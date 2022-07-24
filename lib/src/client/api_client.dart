import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/models.dart';

part 'api_client.g.dart';

/// ****** API Client ******* ////
@RestApi(baseUrl: 'https://gorest.co.in/public/v2/')
abstract class ApiClient {
  factory ApiClient(dio.Dio dio, {String? baseUrl}) = _ApiClient;

  ///Static create method
  // static Future<ApiClient> create({String? base, required Reader read}) async {
  //   final dio = Dio();
  //   dio.interceptors.add(PrettyDioLogger());
  //   dio.options.headers['content-Type'] = 'application/json';
  //   final configs = await read(configurationsProvider.future);
  //   dio.options.headers["Authorization"] = "Bearer ${configs.apiKey}";
  //   return ApiClient(dio, baseUrl: base);
  // }

  /// ************************************ GET APIS ********************************** ///
  ///
  /// ======== Get All Users ======== ////
  @GET('users')
  Future<List<UserModel>> getUsers();

  /// ======== Get Single User Detail ======== ////
  /// Get using @[Path]
  @GET('users/{id}') //E.g /users/234
  Future<UserModel> getSingleUsers(@Path('id') String id);

  /// ======== Get All Comments of specific post ======== ////
  /// Get using @[Query]
  @GET('comments') //E.g /comments?post_id=10
  Future<List<CommentModel>> getPostComments(@Query('post_id') String postId);

  /// ======== Get All Comments of specific post query map ======== ////
  /// Get using @[Queries]
  @GET('comments') //E.g /comments?post_id=10&email=test@gmail.com
  Future<List<CommentModel>> getPostCommentsWithQueryMap(@Queries() Map<String, dynamic> queries);

  /// ************************************ POST APIS ********************************** /// Requires Authorization
  ///
  /// Post using @[Body]
  @POST('users')
  // @Headers(<String, dynamic>{HttpHeaders.authorizationHeader: key}) //for api key with static key
  Future<UserModel> createUser(@Body() UserModel userModel);

  /// ************************************ PUT APIS ********************************** /// Requires Authorization
  ///
  /// Put using @[Path] @[Body]
  @PUT('users/{id}')
  // @Headers(<String, dynamic>{HttpHeaders.authorizationHeader: key}) //for api key with static key
  Future<UserModel> updateUser(@Path('id') String id, @Body() UserModel userModel);

  /// ************************************ DELETE APIS ********************************** /// Requires Authorization
  ///Delete using @[Path]
  @DELETE('users/{id}')
  // @Headers(<String, dynamic>{HttpHeaders.authorizationHeader: key}) //for api key with static key
  Future<void> deleteUser(@Path('id') int id);
}
