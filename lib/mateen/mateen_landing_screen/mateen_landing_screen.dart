import 'package:flutter/material.dart';

import '../../utils/reusable_widgets/custom_elevated_button.dart';
import '../concepts/change_notifier_provider.dart';
import '../concepts/family_modifiers.dart';
import '../concepts/future_provider.dart';
import '../concepts/provider_in_riverpod.dart';
import '../concepts/state_notifier_provider.dart';
import '../concepts/state_provider.dart';
import '../concepts/stream_provider.dart';

class MateenLandingScreen extends StatelessWidget {
  const MateenLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MATEEN"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            CustomElevatedButton(
              onPressedFunction: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ProviderInRiverpodScreen();
                    },
                  ),
                );
              },
              textString: "Provider In Riverpod",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
              onPressedFunction: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const CounterStateProviderScreen();
                    },
                  ),
                );
              },
              textString: "State Provider",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
              onPressedFunction: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const FutureProviderScreen();
                    },
                  ),
                );
              },
              textString: "Future Provider",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
              onPressedFunction: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const StreamProviderScreen();
                    },
                  ),
                );
              },
              textString: "Stream Provider",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
              onPressedFunction: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const StateNotifierProviderScreen();
                    },
                  ),
                );
              },
              textString: "State Notifier Provider",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
              onPressedFunction: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ChangeNotifierProviderScreen();
                    },
                  ),
                );
              },
              textString: "Change Notifier Provider",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
              onPressedFunction: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const FamilyModifiersScreen();
                    },
                  ),
                );
              },
              textString: "Family Modifier",
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
