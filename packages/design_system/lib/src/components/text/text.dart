import 'package:design_system/src/components/text/text_span.dart';
import 'package:design_system/src/foundation/colors.dart';
import 'package:design_system/src/foundation/text_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as m;

class Text extends m.StatelessWidget {
  final String data;
  final TextStyle? style;
  final m.TextAlign? textAlign;
  final bool isSelectable;

  const Text(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.isSelectable = false,
  });

  @override
  m.Widget build(m.BuildContext context) {
    if (isSelectable) {
      return m.SelectableText(
        data,
        textAlign: textAlign,
        style: style,
        selectionColor: Colors.white.alpha20.toMaterialColor(),
      );
    }

    return m.Text(data, textAlign: textAlign, style: style);
  }

  static m.Widget rich(
    final TextSpan textSpan, {
    final m.TextAlign? textAlign,
    final TextStyle? style,
    final bool isSelectable = false,
  }) {
    final materialTextSpan = m.TextSpan(
      text: textSpan.text,
      style: textSpan.style,
      children: textSpan.children,
      recognizer: textSpan.type.getCurrentRecognizer(textSpan.text ?? ''),
    );

    if (isSelectable) {
      return m.SelectableText.rich(
        materialTextSpan,
        style: style,
        selectionColor: Colors.white.alpha20.toMaterialColor(),
        textAlign: textAlign,
      );
    }

    return m.Text.rich(materialTextSpan, style: style, textAlign: textAlign);
  }
}
