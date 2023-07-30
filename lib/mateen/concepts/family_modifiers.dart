import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/api_services.dart';

final familyModifier = FutureProvider.autoDispose.family<String, String>(
  (ref, cityName) => fetchFutureWeatherReportFamily(
    city: cityName,
  ),
);

class FamilyModifiersScreen extends ConsumerWidget {
  const FamilyModifiersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: ref.watch(familyModifier("Rawalpindi")).when(
        data: (data) {
          return Center(
            child: Text(
              data,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(child: Text(error.toString()));
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
