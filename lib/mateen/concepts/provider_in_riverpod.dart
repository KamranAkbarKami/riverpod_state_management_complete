import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final providerInRiverpod = Provider<String>(
  (ref) => "Provider In Riverpod.",
);

class ProviderInRiverpodScreen extends ConsumerWidget {
  const ProviderInRiverpodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String text = ref.read(providerInRiverpod);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
