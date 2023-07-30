import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/screen_sizes.dart';

final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(
    const Duration(seconds: 2),
    ((computationCount) => computationCount),
  );
});

class StreamProviderExample extends ConsumerWidget {
  const StreamProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamData = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Provider"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        height: ScreenSizes.getHeight(context: context),
        width: ScreenSizes.getWidth(context: context),
        child: streamData.when(data: (data) {
          return Center(
            child: Text(
              data.toString(),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }, error: (error, stackTrace) {
          return Text(error.toString());
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
