import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/api_services.dart';
import '../../utils/screen_sizes.dart';

final weatherFutureProvider = FutureProvider.autoDispose<String>(
  (ref) => fetchFutureWeatherReport(),
);

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        width: ScreenSizes.getWidth(context: context),
        height: ScreenSizes.getHeight(context: context),
        child: ref.watch(weatherFutureProvider).when(
          data: (data) {
            return Text(
              data,
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
