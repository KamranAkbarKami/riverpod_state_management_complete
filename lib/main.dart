import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'introduction_screen/introduction_screen.dart';

void main() {
  runApp(
    /*
    Provider Scope Stores all the States that we create in our App
    It created the instance of Provider Container
    */
    const ProviderScope(
      child: RiverpodDemoApp(),
    ),
  );
}

final nameProvider = Provider((ref) {
  return "Hello Kamran";  
});

class RiverpodDemoApp extends StatelessWidget {
  const RiverpodDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Riverpod Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.grey,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blueGrey),
        scaffoldBackgroundColor: Colors.grey,
      ),
      home: const IntroductionScreen(),
    );
  }
}


