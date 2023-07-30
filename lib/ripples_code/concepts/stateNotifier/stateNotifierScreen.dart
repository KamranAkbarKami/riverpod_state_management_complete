import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/screen_sizes.dart';
import '../../../utils/textStyles.dart';
import '../autoDisposeModifier/provider_auto_dispose.dart';

final counterProvider =
    StateNotifierProvider<CounterDemo, int>((ref) => CounterDemo());

class StateNotifierScreen extends ConsumerWidget {
  const StateNotifierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Notifier Provider"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        height: ScreenSizes.getHeight(context: context),
        width: ScreenSizes.getWidth(context: context),
        alignment: Alignment.center,
        child: Flex(
          mainAxisSize: MainAxisSize.min,
          direction: Axis.vertical,
          children: [
            Text(
              counter.toString(),
              style: CustomTextStyles.black530,
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
