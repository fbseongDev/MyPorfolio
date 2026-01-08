import 'dart:ui' as u;

import 'package:design_system/src/foundation/color.dart';
import 'package:design_system/src/foundation/colors.dart';
import 'package:flutter/material.dart' as m;

/// 색상 빛 효과
class AmbientCircle extends m.StatelessWidget {
  final m.Color color;
  final double size;

  AmbientCircle({super.key, required Color color, required this.size})
    : color = color.toMaterialColor();

  @override
  m.Widget build(m.BuildContext context) {
    return m.Container(
      width: size,
      height: size,
      decoration: m.BoxDecoration(shape: m.BoxShape.circle, color: color),
      child: m.BackdropFilter(
        filter: u.ImageFilter.blur(sigmaX: 70, sigmaY: 70),
        child: m.Container(color: Colors.transparent.toMaterialColor()),
      ),
    );
  }
}
