import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_retrofit/src/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/pagination_notifier.dart';
import '../providers/pagination_state.dart';

class PaginationUserPage extends ConsumerStatefulWidget {
  const PaginationUserPage({Key? key}) : super(key: key);

  @override
  ConsumerState<PaginationUserPage> createState() => _PaginationPageState();
}

class _PaginationPageState extends ConsumerState<PaginationUserPage> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchPaginatedData();
    setupScrollController();
  }

  Future<void> fetchPaginatedData() async {
    await ref.read(userPaginationControllerProvider.notifier).fetchPaginatedApiData();
  }

  void setupScrollController() {
    scrollController.addListener(() async {
      ///No Progress
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          await fetchPaginatedData();
        }
      }
      // if (scrollController.offset == scrollController.position.maxScrollExtent) {
      //   await fetchPaginatedData();
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagination User Page'),
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final state = ref.watch(userPaginationControllerProvider);
          if (state.status == PaginationStateStatus.loading && state.isFirstFetched) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          //this list refer to loaded data if the state is loaded and refers to old loaded data if state is loading
          List<UserModel> dataList = [];
          bool isLoading = false;
          if (state.status == PaginationStateStatus.loading) {
            dataList = state.oldDataList;
            isLoading = true;
          } else if (state.status == PaginationStateStatus.loaded) {
            dataList = state.dataList;
          }

          if (dataList.isEmpty) {
            return const Center(
              child: Text('No Post Data'),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              controller: scrollController,
              itemCount: dataList.length + (isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < dataList.length) {
                  final singlePost = dataList[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    title: Text('${singlePost.id.toString()}. ${singlePost.name}'),
                    subtitle: Text('${singlePost.email}'),
                  );
                } else {
                  Timer(const Duration(milliseconds: 30), () {
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
