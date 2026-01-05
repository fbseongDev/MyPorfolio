import 'package:design_system/src/foundation/text_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as m;

class Text extends m.StatelessWidget {
  final String data;
  final m.TextStyle style;
  final m.TextAlign? textAlign;

  Text(this.data, {super.key, this.textAlign, TextStyle? style})
    : style = m.TextStyle(
        fontSize: style?.fontSize,
        fontWeight: style?.fontWeight,
        color: style?.color,
        height: style?.height,
        letterSpacing: style?.letterSpacing,
      );

  @override
  m.Widget build(m.BuildContext context) {
    if(kDebugMode){
      return m.Text(data, textAlign: textAlign, style: style);
    }
    return m.SelectableText(data, textAlign: textAlign, style: style);
  }
}
