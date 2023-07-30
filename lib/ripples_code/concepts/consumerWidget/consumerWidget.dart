import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../main.dart';
import '../../../utils/screen_sizes.dart';
import '../../../utils/textStyles.dart';


class HomePageConsumer extends StatelessWidget {
  const HomePageConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Consumer(
              builder: (context, ref, child) {
                final name = ref.watch(nameProvider);
                /**/
                return Text(
                  name,
                  style: CustomTextStyles.black530,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
