import 'dart:developer';
import 'dart:io';
import 'dart:isolate';

import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:palm_detection/app/palm_detector/command.dart';
import 'package:palm_detection/app/palm_detector/palm_detector_service.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class PalmDetector {
  PalmDetector._({
    required Isolate isolate,
    required Interpreter interpreter,
  })  : _isolate = isolate,
        _interpreter = interpreter;

  static Future<PalmDetector> start({
    required String modelAssetPath,
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

    final palmDetector =
        PalmDetector._(isolate: isolate, interpreter: interpreter);

    receivePort.listen(
      (message) => palmDetector._commandHandler(message as Command),
    );

    return palmDetector;
  }

  final Interpreter _interpreter;
  final Isolate _isolate;
  late final SendPort _sendPort;

  bool _isReady = false;

  void _commandHandler(Command command) {
    log(command.toString(), name: 'PalmDetector');

    command.maybeWhen(
      start: (sendPort) {
        _sendPort = sendPort;

        _sendPort.send(
          Command.initService(
            rootToken: RootIsolateToken.instance!,
            interpreterAddress: _interpreter.address,
          ),
        );
      },
      ready: () => _isReady = true,
      busy: () => _isReady = false,
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
