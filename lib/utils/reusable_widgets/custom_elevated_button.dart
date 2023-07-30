import 'package:flutter/material.dart';

import '../screen_sizes.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function()? onPressedFunction;
  final String textString;

  const CustomElevatedButton({
    super.key,
    required this.onPressedFunction,
    required this.textString,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedFunction,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
          ScreenSizes.getWidth(context: context),
          50,
        ),
      ),
      child: Text(
        textString,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
