import 'package:flutter/material.dart';
import 'package:flutter_retrofit/src/models/models.dart';
import 'package:flutter_retrofit/src/providers/api_future_providers.dart';
import 'package:flutter_retrofit/src/providers/ui_providers.dart';
import 'package:flutter_retrofit/src/screens/pagination/screens/pagination_post_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pagination/screens/pagination_user_page.dart';
import 'user_detail_screen.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userListProviderValue = ref.watch(userListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PaginationPostPage(),
                ),
              );
            },
            child: const Text(
              'Post Pagination',
              style: TextStyle(color: Colors.white),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PaginationUserPage(),
                ),
              );
            },
            child: const Text(
              'User Pagination',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(getPostCommentActive.notifier).state = true;
                      ref.read(selectedPostProvider.notifier).state = '1698';
                      ref.read(commentListProvider(ref.watch(selectedPostProvider)!));
                    },
                    child: const Text('Get Post Comment'),
                  ),
                ),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Get Post Comment With Query'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: ElevatedButton(
                    onPressed: () async {
                      print('Loading .....');
                      final successFailure = await ref.read(createUserProvider(
                        const UserModel(
                          name: 'Ishwor Exp',
                          email: 'ishwortest2@gmail.com',
                          gender: 'Male',
                          status: 'active',
                        ),
                      ).future);

                      successFailure.fold(
                        (l) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failure : ${l.message}'))),
                        (r) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('User Created'))),
                      );

                      ref.invalidate(userListProvider);
                      print('Successs /Failure');
                    },
                    child: const Text('Create User'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ref.watch(getPostCommentActive)
                ? Center(
                    child: ref.watch(commentListProvider(ref.watch(selectedPostProvider)!)).when(
                          data: (errorOrUserData) {
                            return errorOrUserData.fold(
                              (error) => Text('ERROR : ${error.message}'),
                              (userList) => ListView.builder(
                                itemCount: userList.length,
                                itemBuilder: (context, index) {
                                  final singleUser = userList[index];
                                  return ListTile(
                                    title: Text(singleUser.name ?? ''),
                                    subtitle: singleUser.body != null ? Text(singleUser.body!) : const SizedBox.shrink(),
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (builder) => UserDetailScreen(userId: singleUser.id!),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          },
                          error: (err, st) => Text('Error $err'),
                          loading: () => const CircularProgressIndicator(),
                        ),
                  )
                : Center(
                    child: userListProviderValue.when(
                      data: (errorOrUserData) {
                        return errorOrUserData.fold(
                          (error) => Text('ERROR : ${error.message}'),
                          (userList) => ListView.builder(
                            itemCount: userList.length,
                            itemBuilder: (context, index) {
                              final singleUser = userList[index];
                              return ListTile(
                                title: Text(singleUser.name ?? ''),
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (builder) => UserDetailScreen(userId: singleUser.id!),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        );
                      },
                      error: (err, st) => Text('Error $err'),
                      loading: () => const CircularProgressIndicator(),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
