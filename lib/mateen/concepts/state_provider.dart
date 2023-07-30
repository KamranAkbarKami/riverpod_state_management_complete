import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStateProvider = StateProvider<int>((ref) => 0);

class CounterStateProviderScreen extends ConsumerWidget {
  const CounterStateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Provide Counter App"),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            int count = ref.watch(counterStateProvider);
            return Text(
              count.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterStateProvider.notifier).state++;
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
/*
StateProvider
1: Used for simple state objects that can change.
2: Ideal for storing simple state variables such as enums, strings, booleans and numbers.
*/
