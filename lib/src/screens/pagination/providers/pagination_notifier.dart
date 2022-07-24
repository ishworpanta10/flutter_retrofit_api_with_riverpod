import 'package:flutter_retrofit/src/screens/pagination/repositories/pagination_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/post_model.dart';
import 'pagination_state.dart';

final postPaginationControllerProvider =
    StateNotifierProvider.autoDispose<PaginationNotifier<PostModel>, PaginationState<PostModel>>((ref) {
  final paginationRepo = ref.watch(paginationRepositoryProvider);
  return PaginationNotifier<PostModel>(
    fetchItems: ({required int page}) {
      print('Input Page : $page');
      return paginationRepo.getPaginatedPostList(page: page);
    },
  );
});

class PaginationNotifier<T> extends StateNotifier<PaginationState<T>> {
  PaginationNotifier({
    // required this.paginationRepository,
    required this.fetchItems,
  }) : super(PaginationState.initial());

  // final PaginationRepository paginationRepository;

  int page = 1;

  final Future<List<T>?> Function({required int page}) fetchItems;

  Future<void> fetchPaginatedApiData() async {
    if (state.status == PaginationStateStatus.loading) return;

    ///we pass the post which has been already fetched in prev state
    final currentState = state;
    var oldDataList = <T>[];

    if (currentState.status == PaginationStateStatus.loaded) {
      oldDataList = currentState.dataList;
    }
    state = state.copyWith(status: PaginationStateStatus.loading, oldDataList: oldDataList, isFirstFetched: page == 1);

    try {
      final List<T>? newDataList = await fetchItems(page: page);
      if (newDataList != null) {
        page++;

        ///we need old as well as new data to show

        final List<T> combinedDataList = state.oldDataList;
        combinedDataList.addAll(newDataList);
        print("Combined List Length : ${combinedDataList.length}");
        state = state.copyWith(status: PaginationStateStatus.loaded, dataList: combinedDataList);
      }
    } catch (err) {
      state = state.copyWith(status: PaginationStateStatus.error, dataList: []);
      print("Error during fetch data with pagination:$err");
    }
  }
}
