import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:palm_detection/app/app.dart';
import 'package:palm_detection/app/palm_detector/palm_detector.dart';

class DetectorWidget extends StatefulWidget {
  const DetectorWidget({super.key});

  @override
  State<DetectorWidget> createState() => _DetectorWidgetState();
}

class _DetectorWidgetState extends State<DetectorWidget>
    with WidgetsBindingObserver {
  late final PalmDetector palmDetector;
  int _selectedCamera = 0;

  set selectedCamera(int value) {
    _selectedCamera = value;
    reinitializeCamera();
    setState(() {});
  }

  int get selectedCamera => _selectedCamera;

  List<CameraDescription>? cameras;
  CameraController? cameraController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initStateAsync();
  }

  Future<void> initStateAsync() async {
    await initializePalmDetector();
    await initializeCamera();
  }

  Future<void> initializePalmDetector() async {
    palmDetector = await PalmDetector.start(
      modelAssetPath: 'assets/palm_detection_full.tflite',
      anchorsAssetPath: 'assets/anchors.csv',
    );
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    if (cameras!.isNotEmpty) {
      cameraController = CameraController(
        cameras![selectedCamera],
        ResolutionPreset.medium,
        enableAudio: false,
      );

      await cameraController!.initialize();
      ScreenParams.previewSize = cameraController!.value.previewSize!;
      await cameraController!.startImageStream(palmDetector.detect);
    }
    setState(() {});
  }

  Future<void> stopCamera() async {
    await cameraController?.stopImageStream();
    final controller = cameraController;
    cameraController = null;
    setState(() {});
    await controller?.dispose();
  }

  Future<void> reinitializeCamera() async {
    await stopCamera();
    await initializeCamera();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Stack(
      children: [
        Builder(
          builder: (context) {
            if (cameraController != null &&
                cameraController!.value.isInitialized) {
              final aspect = 1 / cameraController!.value.aspectRatio;

              return AspectRatio(
                aspectRatio: aspect,
                child: CameraPreview(cameraController!),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        // Select Camera
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < (cameras?.length ?? 0); i++)
                  IconButton(
                    iconSize: 36,
                    onPressed: () {
                      selectedCamera = i;
                    },
                    color: selectedCamera == i ? colors.primary : null,
                    icon: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.camera_alt,
                            size: 32,
                          ),
                          Text('Camera ${i + 1}'),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        stopCamera();
      case AppLifecycleState.resumed:
        initializeCamera();
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
      case AppLifecycleState.paused:
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    stopCamera();
    palmDetector.stop();
    super.dispose();
  }
}
