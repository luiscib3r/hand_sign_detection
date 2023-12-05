import 'package:flutter/material.dart';
import 'package:palm_detection/home/home.dart';

export 'extensions/extensions.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
