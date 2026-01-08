import 'package:design_system/src/foundation/colors.dart';
import 'package:flutter/material.dart' as m;

class TextButton extends m.StatelessWidget {
  final m.VoidCallback onPressed;
  final m.Widget child;

  const TextButton({super.key, required this.onPressed, required this.child});

  @override
  m.Widget build(m.BuildContext context) {
    return m.TextButton(
      onPressed: onPressed,
      style: m.ButtonStyle(
        overlayColor: m.WidgetStateColor.resolveWith(
          (states) => Colors.white.alpha20.toMaterialColor(),
        ),
      ),
      child: m.IgnorePointer(child: child),
    );
  }
}
