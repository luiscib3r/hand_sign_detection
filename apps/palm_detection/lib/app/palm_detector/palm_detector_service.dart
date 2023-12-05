// ignore_for_file: avoid_print

import 'dart:developer';
import 'dart:io';
import 'dart:isolate';

import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:palm_detection/app/extensions/camera_image_extension.dart';
import 'package:palm_detection/app/palm_detector/command.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class PalmDetectorService {
  PalmDetectorService._(this._sendPort);

  final SendPort _sendPort;

  late final Interpreter _interpreter;
  static const _inputShape = [192, 192];
  static const _outputRegShape = [2016, 18];
  static const _outputClsShape = [2016, 1];

  static void run(SendPort sendPort) {
    final receivePort = ReceivePort();

    final service = PalmDetectorService._(sendPort);

    receivePort.listen(
      (message) => service._commandHandler(message as Command),
    );

    sendPort.send(Command.start(sendPort: receivePort.sendPort));
  }

  void _commandHandler(Command command) {
    log(command.toString(), name: 'PalmDetectorService');

    command.maybeWhen(
      detect: _detect,
      initService: (rootToken, address) async {
        BackgroundIsolateBinaryMessenger.ensureInitialized(rootToken);

        _interpreter = Interpreter.fromAddress(address);

        _sendPort.send(const Command.ready());
      },
      orElse: () {},
    );
  }

  void _detect(CameraImage frame) {
    var image = frame.toImage();

    if (image != null) {
      if (Platform.isAndroid) {
        image = img.copyRotate(image, angle: 90);
      }

      final imageNorm = _preprocessImage(image);
      final outputs = _runInference(imageNorm);

      log(outputs.toString(), name: 'PalmDetectorService');
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
          _outputClsShape[0],
          List<double>.filled(_outputClsShape[1], 0),
        ),
      ],
    };

    _interpreter.runForMultipleInputs([input], output);

    return output;
  }
}
