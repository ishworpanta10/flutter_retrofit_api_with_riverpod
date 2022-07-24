import 'package:flutter_retrofit/src/screens/pagination/services/pagination_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/post_model.dart';

final paginationRepositoryProvider = Provider<PaginationRepository>((ref) {
  final paginationService = ref.watch(paginationServiceProvider);
  return PaginationRepository(paginationService: paginationService);
});

class PaginationRepository {
  final PaginationService paginationService;
  const PaginationRepository({required this.paginationService});

  Future<List<PostModel>?> getPaginatedPostList({int page = 1, int limit = 10}) async {
    return paginationService.getPaginatedPostList(limit: limit, page: page);
  }
}
