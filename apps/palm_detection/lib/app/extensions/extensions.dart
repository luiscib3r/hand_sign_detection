import 'package:flutter/material.dart';

export 'camera_image_extension.dart';

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;
}
