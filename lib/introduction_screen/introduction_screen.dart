import 'package:flutter/material.dart';
import '../mateen/mateen_landing_screen/mateen_landing_screen.dart';
import '../ripples_code/ripplescode_landing_screen/ripples_code_landing_screen.dart';
import '../utils/reusable_widgets/custom_elevated_button.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RIVERPOD CONCEPTS"),
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
                      return const MateenLandingScreen();
                    },
                  ),
                );
              },
              textString: "Code With Mateen",
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
                      return const RipplesCodeLandingScreen();
                    },
                  ),
                );
              },
              textString: "Ripples Code",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
              onPressedFunction: () {},
              textString: "Rivan Ranawat",
            ),
          ],
        ),
      ),
    );
  }
}
