import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}

final counterProvider = StateNotifierProvider.autoDispose<CounterNotifier, int>(
  (ref) => CounterNotifier(),
);

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          count.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(),
          FloatingActionButton(
            onPressed: () {
              ref.read(counterProvider.notifier).decrement();
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
              ref.read(counterProvider.notifier).increment();
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
