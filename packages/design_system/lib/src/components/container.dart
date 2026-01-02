import 'dart:ui';

import 'package:flutter/material.dart' as m;
import 'package:design_system/src/foundation/border_radius.dart';

class Container extends m.StatelessWidget {
  final double? width;
  final double? height;
  final m.BoxDecoration? decoration;
  final m.Widget? child;
  final m.EdgeInsetsGeometry? padding;
  final m.EdgeInsetsGeometry? margin;

  Container({
    super.key,
    this.width,
    this.height,
    this.child,
    this.padding,
    this.margin,

    m.BoxDecoration? decoration,
  }) : decoration =
           decoration ??
           m.BoxDecoration(
             color: m.Colors.white.withOpacity(0.05),
             border: m.Border.all(color: m.Colors.white.withOpacity(0.1)),
             borderRadius: BorderRadius.all.normal,
           );

  @override
  m.Widget build(m.BuildContext context) {
    return m.Container(
      margin: margin,
      child: m.ClipRRect(
        borderRadius: decoration?.borderRadius ?? m.BorderRadius.circular(20),
        child: m.BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: m.Container(
            padding: padding,
            width: width,
            height: height,
            decoration: decoration,
            child: child,
          ),
        ),
      ),
    );
  }
}
