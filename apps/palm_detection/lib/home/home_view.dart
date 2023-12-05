import 'package:flutter/material.dart';
import 'package:palm_detection/home/home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Palm Detection'),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: DetectorWidget(),
        ),
      ),
    );
  }
}
