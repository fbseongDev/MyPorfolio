// import 'dart:ui';
//
// import 'package:flutter/material.dart';
//
// class GlassFeatureSection extends StatelessWidget {
//   final double progress;
//   const GlassFeatureSection({super.key, required this.progress});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         children: [
//           const Text("Capabilities", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 40),
//           Wrap(
//             spacing: 20,
//             runSpacing: 20,
//             children: [
//               _buildGlassCard("Smooth\nAnimations", Icons.auto_awesome, progress),
//               _buildGlassCard("Clean\nArchitecture", Icons.architecture, progress),
//               _buildGlassCard("Fast\nPerformance", Icons.bolt, progress),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildGlassCard(String title, IconData icon, double p) {
//     return Opacity(
//       opacity: p,
//       child: Transform.translate(
//         offset: Offset(0, 50 * (1 - p)),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(20),
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//             child: Container(
//               width: 160,
//               height: 200,
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.05),
//                 border: Border.all(color: Colors.white.withOpacity(0.1)),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(icon, size: 40, color: Colors.blueAccent),
//                   const SizedBox(height: 15),
//                   Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }