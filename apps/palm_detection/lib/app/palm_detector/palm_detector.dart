import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:palm_detection/app/palm_detector/command.dart';
import 'package:palm_detection/app/palm_detector/palm_detection.dart';
import 'package:palm_detection/app/palm_detector/palm_detector_service.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

export 'screen_params.dart';

class PalmDetector {
  PalmDetector._({
    required Isolate isolate,
    required Interpreter interpreter,
    required List<List<double>> anchors,
  })  : _isolate = isolate,
        _interpreter = interpreter,
        _anchors = anchors;

  static Future<PalmDetector> start({
    required String modelAssetPath,
    required String anchorsAssetPath,
  }) async {
    final receivePort = ReceivePort();

    final interpreterOptions = InterpreterOptions()..threads = 4;

    if (Platform.isAndroid) {
      interpreterOptions.addDelegate(XNNPackDelegate());
    } else if (Platform.isIOS) {
      interpreterOptions.addDelegate(GpuDelegate());
    }

    final interpreter = await Interpreter.fromAsset(
      modelAssetPath,
      options: interpreterOptions..threads = 4,
    );

    interpreter.allocateTensors();

    final isolate = await Isolate.spawn(
      PalmDetectorService.run,
      receivePort.sendPort,
    );

    final anchorsString = await rootBundle.loadString(anchorsAssetPath);

    final anchors = anchorsString
        .split('\n')
        .map(
          (line) => line.split(',').map((e) {
            try {
              return double.parse(e);
            } catch (_) {
              return 0.0;
            }
          }).toList(),
        )
        .toList();

    final palmDetector = PalmDetector._(
      isolate: isolate,
      interpreter: interpreter,
      anchors: anchors,
    );

    receivePort.listen(
      (message) => palmDetector._commandHandler(message as Command),
    );

    return palmDetector;
  }

  final Interpreter _interpreter;
  final List<List<double>> _anchors;
  final Isolate _isolate;
  late final SendPort _sendPort;

  Stream<List<PalmDetection>> get results => resultsController.stream;
  final StreamController<List<PalmDetection>> resultsController =
      StreamController.broadcast();

  bool _isReady = false;

  void _commandHandler(Command command) {
    command.maybeWhen(
      start: (sendPort) {
        _sendPort = sendPort;

        _sendPort.send(
          Command.initService(
            rootToken: RootIsolateToken.instance!,
            interpreterAddress: _interpreter.address,
            anchors: _anchors,
          ),
        );
      },
      ready: () => _isReady = true,
      busy: () => _isReady = false,
      result: (detections) {
        _isReady = true;
        resultsController.add(detections);
      },
      orElse: () {},
    );
  }

  void detect(CameraImage frame) =>
      _isReady ? _sendPort.send(Command.detect(frame: frame)) : null;

  void stop() {
    _interpreter.close();
    _isolate.kill();
  }
}
