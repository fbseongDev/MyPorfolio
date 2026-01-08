import 'dart:ui';

import 'package:design_system/src/foundation/color.dart';

class BoxShadow {
  final Color color;
  final double blurRadius;
  final double spreadRadius;

  final Offset offset;

  const BoxShadow({
    required this.color,
    required this.blurRadius,
    required this.spreadRadius,

    this.offset = Offset.zero,
  });
}
