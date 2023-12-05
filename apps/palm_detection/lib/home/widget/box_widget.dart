import 'package:flutter/material.dart';
import 'package:palm_detection/app/app.dart';
import 'package:palm_detection/app/palm_detector/palm_detection.dart';

class BoxWidget extends StatelessWidget {
  const BoxWidget({required this.detection, super.key});

  final PalmDetection detection;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Positioned(
      left: detection.renderBox.left,
      top: detection.renderBox.top,
      width: detection.renderBox.width,
      height: detection.renderBox.height,
      child: Container(
        width: detection.renderBox.width,
        height: detection.renderBox.height,
        decoration: BoxDecoration(
          border: Border.all(color: colors.background, width: 3),
          borderRadius: const BorderRadius.all(Radius.circular(2)),
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: FittedBox(
            child: ColoredBox(
              color: colors.background,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(' ${detection.score.toStringAsFixed(2)}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
