import 'package:design_system/src/foundation/color.dart';
import 'package:design_system/src/foundation/colors.dart';
import 'package:flutter/material.dart' as m;

class Scaffold extends m.StatelessWidget {
  final m.Widget body;
  final m.Color backgroundColor;

  Scaffold({super.key, required this.body, Color? backgroundColor})
    : backgroundColor = (backgroundColor ?? Colors.black).toMaterialColor();

  @override
  m.Widget build(m.BuildContext context) {
    return m.Scaffold(body: body, backgroundColor: backgroundColor);
  }
}
