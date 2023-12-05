import 'dart:isolate';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:palm_detection/app/palm_detector/palm_detection.dart';

part 'command.freezed.dart';

@freezed
class Command with _$Command {
  const factory Command.start({
    required SendPort sendPort,
  }) = _CommandStart;

  const factory Command.initService({
    required RootIsolateToken rootToken,
    required int interpreterAddress,
    required List<List<double>> anchors,
  }) = _CommandRegisterIsolate;

  const factory Command.detect({
    required CameraImage frame,
  }) = _CommandDetect;

  const factory Command.ready() = _CommandReady;
  const factory Command.busy() = _CommandBusy;

  const factory Command.result({
    required List<PalmDetection> detections,
  }) = _CommandResult;
}
