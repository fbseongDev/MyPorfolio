import 'package:flutter/material.dart' as m;

@m.immutable
final class BoxDecoration extends m.BoxDecoration {
  // final m.Color? color;
  // final m.BorderRadius? borderRadius;
  // final m.Border? border;
  // final List<m.BoxShadow>? boxShadow;
  // final m.BoxShape shape;

  const BoxDecoration({
    super.color,
    super.borderRadius,
    super.border,
    super.boxShadow,
    super.shape,
  });
}
