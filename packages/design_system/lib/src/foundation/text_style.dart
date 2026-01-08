import 'package:design_system/src/foundation/color.dart';
import 'package:flutter/material.dart' as m;

@m.immutable
final class TextStyle extends m.TextStyle {
  TextStyle({
    super.fontSize,
    super.fontWeight,
    Color? color,
    super.height,
    super.letterSpacing,
    super.decoration,
  }) : super(color: color?.toMaterialColor());
}
