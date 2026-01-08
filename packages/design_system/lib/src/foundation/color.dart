import 'package:flutter/material.dart' as m;

class Color {
  final int value;

  const Color(this.value);

  m.Color toMaterialColor() => m.Color(value);

  static Color fromMaterialColor(m.Color color) => Color(color.value);

  Color _withAlpha(int a) =>
      Color.fromMaterialColor(toMaterialColor().withAlpha(a));

  Color get alpha0 => _withAlpha(0);

  Color get alpha10 => _withAlpha(26);

  Color get alpha20 => _withAlpha(51);

  Color get alpha30 => _withAlpha(77);

  Color get alpha40 => _withAlpha(102);

  Color get alpha50 => _withAlpha(128);

  Color get alpha60 => _withAlpha(153);

  Color get alpha70 => _withAlpha(179);

  Color get alpha80 => _withAlpha(204);

  Color get alpha90 => _withAlpha(230);

  Color withOpacity(double opacity) =>
      Color.fromMaterialColor(toMaterialColor().withOpacity(opacity));
}
