import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

/// 특기 소개 Section
class GlassFeatureSection extends StatelessWidget {
  final double progress;

  const GlassFeatureSection({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Text(
            "Capabilities",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              GlassCard(
                title: "Smooth\nAnimations",
                icon: Icons.auto_awesome,
                p: progress,
              ),
              GlassCard(
                title: "Clean\nArchitecture",
                icon: Icons.architecture,
                p: progress,
              ),
              GlassCard(
                title: "Fast\nPerformance",
                icon: Icons.bolt,
                p: progress,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
