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
        // clipBehavior:m.Clip.hardEdge,
        // todo:: 이거 둥글기 설정하기
        // todo:: shape는 설정되어 있는데 backgroundColor는 설정이 안 되어 있어서 아래 Container가 둥글기 설정이 안됨
        // todo:: 그래서 Container의 glass 효과를 가지면서 둥글기 설정 방법을 고안하기
        shape: m.RoundedRectangleBorder(borderRadius: BorderRadius.all.normal),
        insetPadding:m. EdgeInsets.all(m.MediaQuery.of(context).size.width / 18),
        child: Container(width: double.infinity, child: builder(context),),
      );
    },
  );
}
