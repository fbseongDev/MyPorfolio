import 'package:flutter/material.dart' as m;
import 'package:design_system/src/foundation/colors.dart';
import 'package:design_system/src/foundation/font_weight.dart';

@m.immutable
final class TextStyle extends m.TextStyle {
  const TextStyle({
    super.fontSize = 14,
    super.fontWeight = FontWeight.normal,
    super.color= Colors.white,
    super.height = 1,
    super.letterSpacing,
    super.decoration = m.TextDecoration.none
  });
}
