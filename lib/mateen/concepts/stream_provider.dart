import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/api_services.dart';
import '../../utils/screen_sizes.dart';

final numberStreamProvider = StreamProvider.autoDispose<int>((ref) => fetchStreamNumber());

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    var streamInt = ref.watch(numberStreamProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        width: ScreenSizes.getWidth(context: context),
        height: ScreenSizes.getHeight(context: context),
        child:streamInt.when(
          data: (data) {
            return Text(
              data.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            );
          },
          error: (error, stackTrace) {
            return Text(error.toString());
          },
          loading: () {
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
