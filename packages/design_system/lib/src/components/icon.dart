import 'package:design_system/src/foundation/color.dart';
import 'package:flutter/material.dart' as m;

class Icon extends m.StatelessWidget {
  final m.IconData icon;
  final m.Color? color;
  final double? size;

  Icon(this.icon, {super.key, Color? color, required this.size})
    : color = color?.toMaterialColor();

  @override
  m.Widget build(m.BuildContext context) {
    return m.Icon(icon, color: color, size: size);
  }
}
