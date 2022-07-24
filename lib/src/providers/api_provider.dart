import 'package:flutter_retrofit/src/client/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'configuration_provider.dart';
import 'dio_providers.dart';

final apiClientProvider = FutureProvider<ApiClient>((ref) async {
  final dio = ref.watch(dioProvider);
  dio.interceptors.add(PrettyDioLogger(responseBody: false));
  dio.options.headers['content-Type'] = 'application/json';
  final configs = await ref.read(configurationsProvider.future);
  dio.options.headers["Authorization"] = "Bearer ${configs.apiKey}";
  return ApiClient(dio);
});
