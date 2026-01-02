import 'dart:ui';

import 'package:flutter/material.dart' as m;
import 'package:design_system/src/foundation/border_radius.dart';
import 'package:design_system/src/foundation/box_decoration.dart';

class Container extends m.StatelessWidget {
  final double? width;
  final double? height;
  final m.BoxDecoration decoration;
  final m.Widget? child;
  final m.EdgeInsetsGeometry? padding;
  final m.EdgeInsetsGeometry? margin;
  final m.Clip clipBehavior;

  Container({
    super.key,
    this.width,
    this.height,
    this.child,
    this.padding,
    this.margin,
    this.clipBehavior = Clip.none,

    BoxDecoration? decoration,
  }) : decoration = m.BoxDecoration(
         color: decoration?.color ?? m.Colors.white.withOpacity(0.05),
         border:
             decoration?.border ??
             m.Border.all(color: m.Colors.white.withOpacity(0.1)),
         borderRadius: decoration?.borderRadius ?? BorderRadius.all.normal,
         boxShadow: decoration?.boxShadow,
       );

  @override
  m.Widget build(m.BuildContext context) {
    return m.Container(
      margin: margin,
      child: m.ClipRRect(
        borderRadius: decoration.borderRadius ?? m.BorderRadius.circular(20),
        child: m.BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: m.Container(
            padding: padding,
            width: width,
            height: height,
            clipBehavior: clipBehavior,
            decoration: decoration,
            child: child,
          ),
        ),
      ),
    );
  }
}
