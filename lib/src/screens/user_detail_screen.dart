import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/api_future_providers.dart';

class UserDetailScreen extends ConsumerWidget {
  const UserDetailScreen({Key? key, required this.userId}) : super(key: key);

  final int userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final singleUserValue = ref.watch(singleUserProvider(userId.toString()));
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Detail'),
      ),
      body: Center(
        child: singleUserValue.when(
          data: (errorOrSingleUser) {
            return errorOrSingleUser.fold(
              (error) => Text('ERROR : ${error.message}'),
              (singleUser) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: ElevatedButton(
                          onPressed: () async {
                            print('Loading .....');
                            final successFailure = await ref.read(updateUserProvider(
                              UserModelWithId(
                                  userModel: singleUser.copyWith(
                                    email: 'messi${singleUser.email}',
                                    name: 'Messi ${singleUser.name}',
                                  ),
                                  userId: userId.toString()),
                            ).future);

                            successFailure.fold(
                              (l) =>
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failure : ${l.message}'))),
                              (r) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('User Created'))),
                            );

                            ref.invalidate(singleUserProvider(userId.toString()));
                            print('Successs /Failure');
                          },
                          child: const Text('Update User'),
                        ),
                      ),
                      Flexible(
                        child: ElevatedButton(
                          onPressed: () async {
                            print('Loading .....');
                            final navigation = Navigator.of(context);
                            final successFailure = await ref.read(deleteUserProvider(userId).future);
                            successFailure.fold(
                              (l) =>
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failure : ${l.message}'))),
                              (r) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('User Deleted'))),
                            );

                            ref.invalidate(userListProvider);
                            navigation.pop();
                            print('Successs /Failure');
                          },
                          child: const Text('Delete User'),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text('Name : ${singleUser.name}'),
                      subtitle: Text(
                        'Email : ${singleUser.email}',
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          error: (error, st) => const Center(child: Text('Error')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
