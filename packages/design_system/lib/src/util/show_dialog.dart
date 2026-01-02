import 'package:flutter/material.dart' as m;
import 'package:design_system/src/foundation/border_radius.dart';
import 'package:design_system/src/foundation/colors.dart';
import 'package:design_system/src/components/container.dart';

Future<T?> showDialog<T>({
  required m.BuildContext context,
  required m.Widget Function(m.BuildContext) builder,
}) async {
  return await m.showDialog<T>(
    context: context,
    barrierColor: Colors.white.withOpacity(0.3),
    builder: (context) {
      return m.Dialog(
        backgroundColor: Colors.transparent,
        shape: m.RoundedRectangleBorder(borderRadius: BorderRadius.all.normal),
        insetPadding: m.EdgeInsets.all(
          m.MediaQuery.of(context).size.width / 24,
        ),
        child: Container(
          width: double.infinity,
          child: m.SingleChildScrollView(
              padding: m.EdgeInsets.all(20),
              child: builder(context)),
        ),
      );
    },
  );
}
