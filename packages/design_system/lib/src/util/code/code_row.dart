import 'package:design_system/design_system.dart';
import 'package:design_system/src/foundation/color.dart';
import 'package:design_system/src/foundation/colors.dart';
import 'package:flutter/material.dart' as m;

sealed class CodeRow {
  final String code;

  const CodeRow(this.code);

  abstract final Color color;
}

class CodeDefault extends CodeRow {
  const CodeDefault(super.code);

  @override
  Color get color => Colors.white;
}

class CodeComment extends CodeRow {
  const CodeComment(super.code);

  @override
  Color get color => Color.fromMaterialColor(m.Colors.grey);
}

class CodeClass extends CodeRow {
  const CodeClass(super.code);

  @override
  Color get color => Color.fromMaterialColor(m.Colors.lightBlueAccent);
}

class CodeMethod extends CodeRow {
  const CodeMethod(super.code);

  @override
  Color get color => Color.fromMaterialColor(m.Colors.lightBlueAccent);
}

class CodeString extends CodeRow {
  const CodeString(super.code);

  @override
  Color get color => Color.fromMaterialColor(m.Colors.lightGreen);
}

class CodeNumber extends CodeRow {
  const CodeNumber(super.code);

  @override
  Color get color => Color.fromMaterialColor(m.Colors.cyanAccent);
}

class CodeKeyword extends CodeRow {
  const CodeKeyword(super.code);

  @override
  Color get color => Colors.orange;

  static const List<String> keywords = [
    'final',
    'var',
    'class',
    'import',
    'extends',
    'implements',
    'abstract',
    'as',
    'assert',
    'async',
    'await',
    'break',
    'case',
    'catch',
    'class',
    'const',
    'continue',
    'default',
    'do',
    'required',
    'this',
  ];
}

class CodeAnnotation extends CodeRow {
  const CodeAnnotation(super.code);

  @override
  Color get color => Color.fromMaterialColor(m.Colors.lime.shade300);
}
