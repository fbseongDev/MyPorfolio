import 'package:design_system/src/foundation/color.dart';
import 'package:flutter/material.dart' as m;

abstract final class Colors {
  static final Color white = Color.fromMaterialColor(m.Colors.white);
  static final Color black = Color.fromMaterialColor(m.Colors.black);
  static final Color purple = Color.fromMaterialColor(m.Colors.purple);
  static final Color transparent = Color.fromMaterialColor(
    m.Colors.transparent,
  );

  static final Color blue = Color.fromMaterialColor(m.Colors.blueAccent);
  static final Color green = Color.fromMaterialColor(m.Colors.greenAccent);
  static final Color orange = Color.fromMaterialColor(m.Colors.orangeAccent);

  static final Color lightGray = Color.fromMaterialColor(m.Colors.white70);
}
