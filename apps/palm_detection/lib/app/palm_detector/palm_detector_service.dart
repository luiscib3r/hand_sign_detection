// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:isolate';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:palm_detection/app/extensions/camera_image_extension.dart';
import 'package:palm_detection/app/palm_detector/candidate_outputs.dart';
import 'package:palm_detection/app/palm_detector/command.dart';
import 'package:palm_detection/app/palm_detector/nms.dart';
import 'package:palm_detection/app/palm_detector/palm_detection.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class PalmDetectorService {
  PalmDetectorService._(this._sendPort);

  final SendPort _sendPort;

  late final Interpreter _interpreter;
  late final List<List<double>> _anchors;
  static const _inputShape = [192, 192];
  static const _outputRegShape = [2016, 18];
  static const _outputClfShape = [2016, 1];
  static const detectionThreshold = 0.6;

  static void run(SendPort sendPort) {
    final receivePort = ReceivePort();

    final service = PalmDetectorService._(sendPort);

    receivePort.listen(
      (message) => service._commandHandler(message as Command),
    );

    sendPort.send(Command.start(sendPort: receivePort.sendPort));
  }

  void _commandHandler(Command command) {
    command.maybeWhen(
      detect: _detect,
      initService: (rootToken, address, anchors) async {
        BackgroundIsolateBinaryMessenger.ensureInitialized(rootToken);

        _interpreter = Interpreter.fromAddress(address);
        _anchors = anchors;
        _sendPort.send(const Command.ready());
      },
      orElse: () {},
    );
  }

  void _detect(CameraImage frame) {
    _sendPort.send(const Command.busy());
    var image = frame.toImage();

    if (image != null) {
      if (Platform.isAndroid) {
        image = img.copyRotate(image, angle: 90);
      }

      final imageNorm = _preprocessImage(image);
      final outputs = _runInference(imageNorm);

      // [2016, 18]
      // outputReg shape is [number of anchors, 18]
      // Second dimension 0 - 4 are bounding box offset,
      // width and height: dx, dy, w, h
      // Second dimension 4 - 18 are 7
      // hand keypoint x and y coordinates: x1,y1,x2,y2,...x7,y7
      final outputReg = outputs[0]![0];

      // [2016, 1]
      // outputClf shape is [number of anchors, 1]
      // it is the classification score if there is a hand for each anchor box
      final outputClf = outputs[1]![0];

      final candidateOutputs = _processOutput(outputReg, outputClf);

      final bbox = _getBbox(
        candidateOutputs.candidateDetect,
        candidateOutputs.candidateAnchors,
        candidateOutputs.candidateProbabilities,
      );

      final selectedBoxIndex = nms(bbox);

      final selectedBoxes = selectedBoxIndex.map((e) => bbox[e]);

      final detections = <PalmDetection>[];

      for (final box in selectedBoxes) {
        detections.add(
          PalmDetection(
            score: box[4],
            bbox: Rect.fromLTRB(
              box[0],
              box[1],
              box[2],
              box[3],
            ),
          ),
        );
      }

      _sendPort.send(Command.result(detections: detections));
    }
  }

  List<List<List<double>>> _preprocessImage(img.Image image) {
    final imgSmall = img.copyResize(
      image,
      width: _inputShape[0],
      height: _inputShape[1],
    );

    final imgNorm = List.generate(
      imgSmall.height,
      (y) => List.generate(
        imgSmall.width,
        (x) {
          final pixel = imgSmall.getPixel(x, y);
          return [pixel.r / 255, pixel.g / 255, pixel.b / 255];
        },
      ),
    );

    return imgNorm;
  }

  Map<int, List<List<List<double>>>> _runInference(
    List<List<List<double>>> imageNorm,
  ) {
    final input = [imageNorm];

    final output = {
      0: [
        List<List<double>>.filled(
          _outputRegShape[0],
          List<double>.filled(_outputRegShape[1], 0),
        ),
      ],
      1: [
        List<List<double>>.filled(
          _outputClfShape[0],
          List<double>.filled(_outputClfShape[1], 0),
        ),
      ],
    };

    _interpreter.runForMultipleInputs([input], output);

    return output;
  }

  static double _sigmoid(double x) => 1 / (1 + exp(-x));

  CandidateOutputs _processOutput(
    List<List<double>> outputReg,
    List<List<double>> outputClf,
  ) {
    final probabilities = outputClf.map((e) => _sigmoid(e[0])).toList();

    final detectionMask =
        probabilities.map((e) => e > detectionThreshold).toList();

    final detectionMaskIndex = detectionMask
        .asMap()
        .entries
        .where((element) => element.value)
        .map((e) => e.key)
        .toList();

    final candidateDetect =
        detectionMaskIndex.map((e) => outputReg[e]).toList();
    final candidateProbabilities =
        detectionMaskIndex.map((e) => probabilities[e]).toList();
    final candidateAnchors =
        detectionMaskIndex.map((e) => _anchors[e]).toList();

    return CandidateOutputs(
      candidateDetect: candidateDetect,
      candidateProbabilities: candidateProbabilities,
      candidateAnchors: candidateAnchors,
    );
  }

  List<List<double>> _getBbox(
    List<List<double>> candidateDetect,
    List<List<double>> candidateAnchors,
    List<double> candidateProbabilities,
  ) {
    final bbox = <List<double>>[];

    for (var i = 0; i < candidateDetect.length; i++) {
      final detect = candidateDetect[i];
      final anchor = candidateAnchors[i];

      final cx = detect[0] + anchor[0] * _inputShape[0];
      final cy = detect[1] + anchor[1] * _inputShape[1];
      final width = detect[2];
      final height = detect[3];

      bbox.add([
        max(0, cx - width),
        max(0, cy - height),
        min(_inputShape[0].toDouble(), cx + width),
        min(_inputShape[1].toDouble(), cy + height),
        candidateProbabilities[i],
      ]);
    }

    return bbox;
  }
}
