import 'package:flutter/material.dart';
import '../../utils/reusable_widgets/custom_elevated_button.dart';
import '../concepts/autoDisposeModifier/provider_auto_dispose.dart';
import '../concepts/consumerWidget/consumerWidget.dart';
import '../concepts/extendConsumerWidget/stf/stfConsumer.dart';
import '../concepts/extendConsumerWidget/stl/counterStlConsumer.dart';
import '../concepts/extendConsumerWidget/stl/stlConsumer.dart';
import '../concepts/futureProvider/futureProvider.dart';
import '../concepts/stateNotifier/stateNotifierScreen.dart';
import '../concepts/streamProvider/strream_provider.dart';

class RipplesCodeLandingScreen extends StatelessWidget {
  const RipplesCodeLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      return const HomePageConsumerWidget();
                    },
                  ),
                );
              },
              textString: "Consumer Widget",
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
                      return const HomePageConsumer();
                    },
                  ),
                );
              },
              textString: "Home Page Consumer",
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
                      return const HomeStateFul();
                    },
                  ),
                );
              },
              textString: "Stateful Widget",
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
                      return const HomePageCounterApp();
                    },
                  ),
                );
              },
              textString: "Home Page Counter Widget",
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
                      return const StateNotifierScreen();
                    },
                  ),
                );
              },
              textString: "State Notifier",
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
                      return const FutureProviderExample();
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
                      return const StreamProviderExample();
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
                      return const AutoDisposeModifierExample();
                    },
                  ),
                );
              },
              textString: "Auto Dispose Modifier",
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
