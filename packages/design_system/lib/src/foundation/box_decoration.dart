import 'package:design_system/src/foundation/box_shadow.dart';
import 'package:design_system/src/foundation/color.dart';
import 'package:flutter/material.dart' as m;

@m.immutable
final class BoxDecoration extends m.BoxDecoration {
  BoxDecoration({
    Color? color,
    super.borderRadius,
    super.border,
    List<BoxShadow>? boxShadow,
    super.shape,
  }) : super(
         color: color?.toMaterialColor(),
         boxShadow: boxShadow
             ?.map(
               (e) => m.BoxShadow(
                 color: e.color.toMaterialColor(),
                 blurRadius: e.blurRadius,
                 spreadRadius: e.spreadRadius,
                 offset: e.offset,
               ),
             )
             .toList(),
       );
}
