import 'package:flutter/material.dart';
import 'package:palm_detection/app/palm_detector/screen_params.dart';

class PalmDetection {
  PalmDetection({
    required this.score,
    required this.bbox,
  });

  final double score;
  final Rect bbox;

  Rect get renderBox {
    final scaleX = ScreenParams.screenPreviewSize.width / 192;
    final scaleY = ScreenParams.screenPreviewSize.height / 192;
    return Rect.fromLTWH(
      bbox.left * scaleX,
      bbox.top * scaleY,
      bbox.width * scaleX,
      bbox.height * scaleY,
    );
  }
}
