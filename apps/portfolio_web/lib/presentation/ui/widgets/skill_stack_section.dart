import 'package:flutter/material.dart';

/// 기술 스택 Section
class SkillStackSection extends StatelessWidget {
  final double progress;
  const SkillStackSection({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Opacity(
            opacity: progress,
            child: Transform.translate(
              offset: Offset(0, 20 * (1 - progress)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Technical Mastery",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "꾸준히 연마해온 나의 무기들입니다.",
                    style: TextStyle(color: Colors.white54, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),

          Wrap(
            spacing: 30,
            runSpacing: 40,
            children: [
              _buildStackCategory(
                "Frontend",
                ["Flutter", "Dart", "React", "Next.js"],
                [0.95, 0.9, 0.7, 0.6],
                Colors.blueAccent,
                progress,
              ),
              _buildStackCategory(
                "Backend & DB",
                ["Firebase", "Node.js", "PostgreSQL"],
                [0.85, 0.65, 0.75],
                Colors.greenAccent,
                progress,
              ),
              _buildStackCategory(
                "Tools & Others",
                ["Git", "Figma", "Docker", "CI/CD"],
                [0.9, 0.8, 0.6, 0.55],
                Colors.orangeAccent,
                progress,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStackCategory(String title, List<String> skills, List<double> levels, Color accentColor, double p) {
    return Opacity(
      opacity: p,
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.03),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: accentColor,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: accentColor.withOpacity(0.5), blurRadius: 8)],
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 25),
            ...List.generate(skills.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(skills[index], style: const TextStyle(color: Colors.white70, fontSize: 14)),
                        Text("${(levels[index] * 100).toInt()}%",
                            style: TextStyle(color: accentColor.withOpacity(0.8), fontSize: 12, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Stack(
                      children: [
                        Container(
                          height: 4,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 1500),
                          height: 4,
                          width: 250 * (levels[index] * p),
                          decoration: BoxDecoration(
                            color: accentColor,
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: [
                              BoxShadow(color: accentColor.withOpacity(0.3), blurRadius: 4, spreadRadius: 1)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}