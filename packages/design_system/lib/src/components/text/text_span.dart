import 'package:design_system/src/foundation/text_span_type.dart';
import 'package:flutter/material.dart' as m;

class TextSpan {
  final String? text;
  final m.TextStyle? style;
  final List<m.TextSpan>? _children;
  final TextSpanType type;

  TextSpan({
    this.text,
    this.style,
    List<TextSpan>? children,
    this.type = TextSpanType.normal,
  }) : _children = children?.map((child) {
         return m.TextSpan(
           text: child.text,
           style: child.style,
           children: child.children,
           // [TextSpanType.hyperLink]라면 클릭 이벤트 추가
           recognizer: child.type.getCurrentRecognizer(child.text ?? ''),
         );
       }).toList();

  List<m.TextSpan>? get children => _children;
}
