// import 'dart:ui';
//
// import 'package:flutter/material.dart';
//
// class AmbientCircle extends StatelessWidget {
//   final Color color;
//   final double size;
//   const AmbientCircle({super.key, required this.color, required this.size});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: size,
//       height: size,
//       decoration: BoxDecoration(shape: BoxShape.circle, color: color),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
//         child: Container(color: Colors.transparent),
//       ),
//     );
//   }
// }