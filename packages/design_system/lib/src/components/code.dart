import 'package:design_system/src/components/text/text.dart';
import 'package:design_system/src/components/text/text_span.dart';
import 'package:design_system/src/foundation/border_radius.dart';
import 'package:design_system/src/foundation/colors.dart';
import 'package:design_system/src/foundation/font_weight.dart';
import 'package:design_system/src/foundation/text_style.dart';
import 'package:design_system/src/util/code/code_plane.dart';
import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/material.dart' as m;
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../util/code/code_language.dart';

class Code extends m.StatelessWidget {
  final CodeLanguage language;
  final CodePlane codePlane;

  Code(String code, {super.key, required this.language})
    : codePlane = CodePlane.parse(code);

  @override
  m.Widget build(m.BuildContext context) {
    return m.Container(
      decoration: m.BoxDecoration(
        color: Colors.black.toMaterialColor(),
        borderRadius: BorderRadius.all.normal,
      ),
      child: m.Column(
        crossAxisAlignment: m.CrossAxisAlignment.start,
        children: [
          _codeHeaderBuilder(),
          _codeDividerBuilder(),
          _codeFieldBuilder(),
        ],
      ),
    );
  }

  m.Widget _codeHeaderBuilder() => m.Builder(
    builder: (context) {
      return m.Padding(
        padding: m.EdgeInsets.only(left: 16),
        child: m.Row(
          crossAxisAlignment: m.CrossAxisAlignment.center,
          children: [
            Text(
              language.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            m.Spacer(),
            m.Padding(
              padding: const m.EdgeInsets.all(2),
              child: HookBuilder(
                builder: (context) {
                  final isPressed = useState(false);

                  return m.Tooltip(
                    message: '복사하기',
                    child: m.InkWell(
                      borderRadius: BorderRadius.all.max,
                      onTap: () async {
                        isPressed.value = true;

                        Clipboard.setData(
                          ClipboardData(text: codePlane.planeText),
                        );

                        await Future.delayed(Duration(milliseconds: 1500));
                        isPressed.value = false;
                      },
                      child: m.Padding(
                        padding: const m.EdgeInsets.all(10),
                        child: isPressed.value
                            ? const m.Icon(c.CupertinoIcons.checkmark_alt)
                            : const m.Icon(c.CupertinoIcons.doc_on_clipboard),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );

  m.Widget _codeDividerBuilder() => m.Builder(
    builder: (context) {
      return m.Container(
        width: double.infinity,
        height: 1,
        color: Colors.white.alpha40.toMaterialColor(),
      );
    },
  );

  m.Widget _codeFieldBuilder() => m.Builder(
    builder: (context) {
      return m.Container(
        padding: m.EdgeInsets.all(16),
        child: Text.rich(
          isSelectable: true,
          TextSpan(
            style: TextStyle(height: 1.3),
            children: codePlane.codeColumns
                .map((codeColumn) {
                  final codeRows = codeColumn.codeRows;

                  final rowCodeLength = codeRows.length;

                  return codeRows.asMap().entries.map((entry) {
                    final codeRow = entry.value;
                    final index = entry.key;

                    final isLastInRow = index == rowCodeLength - 1;

                    return TextSpan(
                      text: '${codeRow.code}${isLastInRow ? '\n' : ''}',
                      style: TextStyle(color: codeRow.color),
                    );
                  });
                })
                .expand((e) => e)
                .toList(),
          ),
        ),
      );
    },
  );
}
