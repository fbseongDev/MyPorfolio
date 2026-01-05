import 'package:design_system/src/components/container.dart';
import 'package:design_system/src/components/text/text.dart';
import 'package:design_system/src/foundation/border_radius.dart';
import 'package:design_system/src/foundation/box_decoration.dart';
import 'package:design_system/src/foundation/colors.dart';
import 'package:design_system/src/foundation/font_weight.dart';
import 'package:design_system/src/foundation/text_style.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter/cupertino.dart' as c;

Future<T?> showDialog<T>({
  required m.BuildContext context,
  required m.Widget Function(m.BuildContext) builder,
  String? title,
}) async {
  return await m.showDialog<T>(
    context: context,
    barrierColor: Colors.white.withAlpha(30),
    builder: (context) {
      return m.Dialog(
        backgroundColor: Colors.transparent,
        shape: m.RoundedRectangleBorder(borderRadius: BorderRadius.all.normal),
        clipBehavior: m.Clip.hardEdge,
        insetPadding: m.EdgeInsets.all(
          m.MediaQuery.of(context).size.width / 24,
        ),
        child: m.SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: m.EdgeInsets.all(20),
            decoration: BoxDecoration(
              // color: Colors.black.withAlpha(100),
            ),
            child: m.Column(
              children: [
                if (title != null) ...[
                  m.Row(
                    crossAxisAlignment: m.CrossAxisAlignment.center,
                    children: [
                      m.Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.extraBold,
                          ),
                        ),
                      ),
                      m.GestureDetector(
                        onTap: () {
                          m.Navigator.pop(context);
                        },
                        child: m.Icon(
                          c.CupertinoIcons.clear_circled_solid,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  m.SizedBox(height: 16),
                ],
                builder(context),
              ],
            ),
          ),
        ),
      );
    },
  );
}
