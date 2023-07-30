import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class User extends ChangeNotifier {
  String userName = "User Name";

  void changeUserNamePrimary() {
    userName = "Kamran Primary";
    notifyListeners();
  }

  void changeUserNameSecondary() {
    userName = "Kamran Secondary";
    notifyListeners();
  }
}

final userProvider = ChangeNotifierProvider.autoDispose<User>(
  (ref) => User(),
);

class ChangeNotifierProviderScreen extends ConsumerWidget {
  const ChangeNotifierProviderScreen({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Consumer(
          builder: (context, provider, child) {
            final data = ref.watch(userProvider);
            return Text(
              data.userName,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(),
          FloatingActionButton(
            onPressed: () {
              ref.read(userProvider.notifier).changeUserNamePrimary();
            },
            child: const Icon(
              Icons.remove,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 200,
          ),
          FloatingActionButton(
            onPressed: () {
              ref.read(userProvider.notifier).changeUserNameSecondary();
            },
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
