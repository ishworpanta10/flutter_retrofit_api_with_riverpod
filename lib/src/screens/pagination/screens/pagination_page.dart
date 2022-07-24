import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_retrofit/src/screens/pagination/models/post_model.dart';
import 'package:flutter_retrofit/src/screens/pagination/providers/pagination_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/pagination_state.dart';

class PaginationPage<T> extends ConsumerStatefulWidget {
  const PaginationPage({Key? key}) : super(key: key);

  @override
  ConsumerState<PaginationPage<T>> createState() => _PaginationPageState();
}

class _PaginationPageState<T> extends ConsumerState<PaginationPage<T>> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchPaginatedData();
    setupScrollController();
  }

  Future<void> fetchPaginatedData() async {
    if (mounted) await ref.read(postPaginationControllerProvider.notifier).fetchPaginatedApiData();
  }

  void setupScrollController() {
    scrollController.addListener(() async {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          // ref.read(postPaginationControllerProvider.notifier).fetchPaginatedApiData();
          await fetchPaginatedData();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagination Page'),
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final state = ref.watch(postPaginationControllerProvider);
          if (state.status == PaginationStateStatus.loading && state.isFirstFetched) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          //this list refer to loaded data if the state is loaded and refers to old loaded data if state is loading
          List<PostModel> dataList = [];
          bool isLoading = false;
          if (state.status == PaginationStateStatus.loading) {
            // print("Insode If");
            dataList = state.dataList;
            isLoading = true;
          } else if (state.status == PaginationStateStatus.loaded) {
            // print("Insode else If");

            dataList = state.dataList;
          }

          // print(isLoading);
          if (dataList.isEmpty) {
            return const Center(
              child: Text('No Post Data'),
            );
          } else {
            return ListView.builder(
              controller: scrollController,
              itemCount: dataList.length + (isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < dataList.length) {
                  final singlePost = dataList[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    title: Text(singlePost.title ?? ''),
                    subtitle: Text(singlePost.body ?? ''),
                  );
                } else {
                  Timer(const Duration(milliseconds: 40), () {
                    scrollController.jumpTo(scrollController.position.maxScrollExtent);
                  });
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
