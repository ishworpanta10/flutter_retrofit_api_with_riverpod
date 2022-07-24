import 'package:flutter/material.dart';
import 'package:flutter_retrofit/src/providers/api_future_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userListProviderValue = ref.watch(userListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
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
                  );
                },
              ),
            );
          },
          error: (err, st) => Text('Error $err'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
