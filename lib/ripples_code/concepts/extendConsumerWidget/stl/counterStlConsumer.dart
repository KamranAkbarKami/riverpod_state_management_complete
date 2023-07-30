import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/screen_sizes.dart';
import '../../../../utils/textStyles.dart';

final counterProvider = StateProvider<int>((ref) => 0);

class HomePageCounterApp extends ConsumerWidget {
  const HomePageCounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    ref.listen(counterProvider, (previous, next) {
      if (next == 5) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("The Value is: $next"),
          ),
        );
      }
    });
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        height: ScreenSizes.getHeight(context: context),
        width: ScreenSizes.getWidth(context: context),
        alignment: Alignment.center,
        child: Flex(
          direction: Axis.vertical,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              counter.toString(),
              style: CustomTextStyles.black530,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  // ref.read(counterProvider.notifier).state++;
                  ref.read(counterProvider.notifier).update(
                        (state) => state + 1,
                      );
                },
                child: const Text(
                  "Add Counter",
                  style: CustomTextStyles.black520,
                )),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  // ref.invalidate(counterProvider);
                  ref.refresh(counterProvider);
                },
                child: const Text(
                  "Reset",
                  style: CustomTextStyles.black520,
                )),
          ],
        ),
      ),
    );
  }
}
