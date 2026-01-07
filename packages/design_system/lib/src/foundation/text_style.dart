import 'package:flutter/material.dart' as m;

@m.immutable
final class TextStyle extends m.TextStyle {
  const TextStyle({
    super.fontSize,
    super.fontWeight,
    super.color,
    super.height,
    super.letterSpacing,
    super.decoration
  });
}
