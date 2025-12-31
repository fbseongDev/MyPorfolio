import 'dart:ui';

import 'package:flutter/material.dart';

/// GlassMorphism 디자인 Card
class GlassCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final double p;

  const GlassCard({
    super.key,
    required this.title,
    required this.icon,
    required this.p,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: p,
      child: Transform.translate(
        offset: Offset(0, 50 * (1 - p)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: 160,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 40, color: Colors.blueAccent),
                  const SizedBox(height: 15),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
