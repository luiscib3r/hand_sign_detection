import 'package:flutter/material.dart';
import 'package:palm_detection/app/palm_detector/screen_params.dart';
import 'package:palm_detection/home/home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenParams.screenSize = MediaQuery.sizeOf(context);
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
