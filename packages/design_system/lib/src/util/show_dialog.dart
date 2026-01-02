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
    builder: (context) {
      return m.Dialog(
        backgroundColor: Colors.transparent,
        shape: m.RoundedRectangleBorder(borderRadius: BorderRadius.all.normal),
        insetPadding:m. EdgeInsets.all(m.MediaQuery.of(context).size.width / 18),
        child: Container(width: double.infinity, child: builder(context),),
      );
    },
  );
}
