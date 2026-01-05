import 'package:design_system/src/components/text/text.dart';
import 'package:design_system/src/foundation/border_radius.dart';
import 'package:design_system/src/foundation/colors.dart';
import 'package:design_system/src/foundation/font_weight.dart';
import 'package:design_system/src/foundation/text_style.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter/services.dart';

import '../util/code_language.dart';

class Code extends m.StatelessWidget {
  final CodeLanguage language;
  final String code;

  const Code(this.code, {super.key, required this.language});

  @override
  m.Widget build(m.BuildContext context) {
    return m.Container(
      decoration: m.BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all.normal,
      ),
      child: m.Column(
        crossAxisAlignment: m.CrossAxisAlignment.start,
        children: [
          m.Padding(
            padding: m.EdgeInsets.only(left: 16),
            child: m.Row(
              crossAxisAlignment: m.CrossAxisAlignment.center,
              children: [
                Text(
                  language.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                m.Spacer(),
                m.Material(
                  color: Colors.transparent,
                  child: m.Padding(
                    padding: const m.EdgeInsets.all(2),
                    child: m.Tooltip(
                      message: '복사하기',
                      child: m.InkWell(
                        borderRadius: BorderRadius.all.max,
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: code));
                        },
                        child: const m.Padding(
                          padding: m.EdgeInsets.all(10),
                          child: m.Icon(m.Icons.copy),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          m.Container(
            width: double.infinity,
            height: 1,
            color: Colors.white.withAlpha(100),
          ),
          m.Container(padding: m.EdgeInsets.all(16), child: Text(code)),
        ],
      ),
    );
  }
}
