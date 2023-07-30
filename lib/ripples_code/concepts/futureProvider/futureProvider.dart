import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../model/user_model.dart';
import '../../../services/api_services.dart';
import '../../../utils/screen_sizes.dart';


final apiProvider = Provider<ApiServices>(
  (ref) => ApiServices(),
);

final userDataProvider = FutureProvider<UserModel>((ref) {
  return ref.read(apiProvider).getUser();
});

class FutureProviderExample extends ConsumerWidget {
  const FutureProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future Provider"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        height: ScreenSizes.getHeight(context: context),
        width: ScreenSizes.getWidth(context: context),
        child: userData.when(
          data: (data) {
            return ListView.separated(
              itemCount: data.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Image.network(data.data![index].avatar!),
                  ),
                  title: Text(
                      "${data.data![index].firstName} ${data.data![index].lastName}"),
                  subtitle: Text("${data.data![index].email}"),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
            );
          },
          error: (error, staTrace) {
            return Text(error.toString());
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
