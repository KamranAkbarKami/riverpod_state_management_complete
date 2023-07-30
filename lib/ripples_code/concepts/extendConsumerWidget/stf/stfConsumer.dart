import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../main.dart';
import '../../../../utils/screen_sizes.dart';
import '../../../../utils/textStyles.dart';

class HomeStateFul extends ConsumerStatefulWidget {
  const HomeStateFul({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeStateFul> createState() => _HomeStateFulState();
}

class _HomeStateFulState extends ConsumerState<HomeStateFul> {
  @override
  void initState() {
    super.initState();
    final userName = ref.read(nameProvider);
    log(userName);
  }

  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);
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
            Text(
              name,
              style: CustomTextStyles.black530,
            )
          ],
        ),
      ),
    );
  }
}
