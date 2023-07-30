import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/screen_sizes.dart';

//Timeout Caching Strategy to Dispose the Providers State

class CounterDemo extends StateNotifier<int> {
  CounterDemo() : super(0);

  void increment() {
    state++;
  }
}

final counterProvider =
    StateNotifierProvider.autoDispose<CounterDemo, int>((ref) {
  // ref.keepAlive();
  final link = ref.keepAlive();
  final timer = Timer(
    const Duration(seconds: 10),
    () {
      link.close();
    },
  );
  ref.onDispose(() {
    timer.cancel();
  });
  return CounterDemo();
});

class AutoDisposeModifierExample extends ConsumerWidget {
  const AutoDisposeModifierExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auto Dispose Notifier"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        height: ScreenSizes.getHeight(context: context),
        width: ScreenSizes.getWidth(context: context),
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Text(
                counter.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
