import 'package:flutter/material.dart' as m;

class TextStyle {
  final double? fontSize;
  final m.FontWeight? fontWeight;
  final m.Color? color;
  final double height;
  final double? letterSpacing;


  const TextStyle({
    this.fontSize,
    this.fontWeight,
    this.color,
    this.height = 1,
    this.letterSpacing,
  });
}
