import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:image/image.dart' as img;

extension CameraImageX on CameraImage {
  img.Image? toImage() {
    return switch (format.group) {
      ImageFormatGroup.yuv420 => _fromYUV420ToImage,
      ImageFormatGroup.bgra8888 => _fromBGRA8888ToImage,
      ImageFormatGroup.jpeg => _fromJPEGToImage,
      ImageFormatGroup.nv21 => _fromNV21ToImage,
      ImageFormatGroup.unknown => null,
    };
  }

  img.Image get _fromYUV420ToImage {
    final width = this.width;
    final height = this.height;

    final uvRowStride = planes[1].bytesPerRow;
    final uvPixelStride = planes[1].bytesPerPixel!;

    final yPlane = planes[0].bytes;
    final uPlane = planes[1].bytes;
    final vPlane = planes[2].bytes;

    final image = img.Image(width: width, height: height);

    var uvIndex = 0;

    for (var y = 0; y < height; y++) {
      var pY = y * width;
      var pUV = uvIndex;

      for (var x = 0; x < width; x++) {
        final yValue = yPlane[pY];
        final uValue = uPlane[pUV];
        final vValue = vPlane[pUV];

        final r = yValue + 1.402 * (vValue - 128);
        final g =
            yValue - 0.344136 * (uValue - 128) - 0.714136 * (vValue - 128);
        final b = yValue + 1.772 * (uValue - 128);

        image.setPixelRgba(x, y, r.toInt(), g.toInt(), b.toInt(), 255);

        pY++;
        if (x.isOdd && uvPixelStride == 2) {
          pUV += uvPixelStride;
        } else if (x.isOdd && uvPixelStride == 1) {
          pUV++;
        }
      }

      if (y.isOdd) {
        uvIndex += uvRowStride;
      }
    }
    return image;
  }

  img.Image get _fromBGRA8888ToImage {
    // Extract the bytes from the CameraImage
    final bytes = planes[0].bytes;

    // Create a new Image instance
    final image = img.Image.fromBytes(
      width: width,
      height: height,
      bytes: bytes.buffer,
      order: img.ChannelOrder.rgba,
    );

    return image;
  }

  img.Image get _fromJPEGToImage {
    // Extract the bytes from the CameraImage
    final bytes = planes[0].bytes;

    // Create a new Image instance from the JPEG bytes
    final image = img.decodeImage(bytes);

    return image!;
  }

  img.Image get _fromNV21ToImage {
    // Extract the bytes from the CameraImage
    final yuvBytes = planes[0].bytes;
    final vuBytes = planes[1].bytes;

    // Create a new Image instance
    final image = img.Image(
      width: width,
      height: height,
    );

    // Convert NV21 to RGB
    convertNV21ToRGB(
      yuvBytes,
      vuBytes,
      width,
      height,
      image,
    );

    return image;
  }
}

void convertNV21ToRGB(
  Uint8List yuvBytes,
  Uint8List vuBytes,
  int width,
  int height,
  img.Image image,
) {
  // Conversion logic from NV21 to RGB
  // ...

  // Example conversion logic using the `imageLib` package
  // This is just a placeholder and may not be the most efficient method
  for (var y = 0; y < height; y++) {
    for (var x = 0; x < width; x++) {
      final yIndex = y * width + x;
      final uvIndex = (y ~/ 2) * (width ~/ 2) + (x ~/ 2);

      final yValue = yuvBytes[yIndex];
      final uValue = vuBytes[uvIndex * 2];
      final vValue = vuBytes[uvIndex * 2 + 1];

      // Convert YUV to RGB
      final r = yValue + 1.402 * (vValue - 128);
      final g = yValue - 0.344136 * (uValue - 128) - 0.714136 * (vValue - 128);
      final b = yValue + 1.772 * (uValue - 128);

      // Set the RGB pixel values in the Image instance
      image.setPixelRgba(x, y, r.toInt(), g.toInt(), b.toInt(), 255);
    }
  }
}
