import 'package:flutter/material.dart' as m;

class Opacity extends m.StatelessWidget {
  final double opacity;
  final m.Widget child;
  final m.Offset offset;

  Opacity({
    super.key,
    required this.opacity,
    required this.child,
    m.Offset? offset,
  }) : offset = offset ?? m.Offset(0, 50 * (1 - opacity));

  @override
  m.Widget build(m.BuildContext context) {
    return m.Opacity(
      opacity: opacity,
      child: m.Transform.translate(
        offset: offset,
        child: child,
      ),
    );
  }
}
