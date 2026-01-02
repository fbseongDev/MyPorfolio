import 'package:flutter/material.dart' as m;

class TextButton extends m.StatelessWidget {
  final m.VoidCallback onPressed;
  final m.Widget child;

  const TextButton({super.key, required this.onPressed, required this.child});

  @override
  m.Widget build(m.BuildContext context) {
    return m.TextButton(
      onPressed: onPressed,
      child: m.IgnorePointer(child: child),
    );
  }
}
