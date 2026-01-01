import 'package:convention/ui.dart';

/// 기술 스택 Section
class SkillStackSection extends StatelessWidget {
  final double progress;

  const SkillStackSection({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Opacity(
            opacity: progress,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Technical Mastery",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.extraBold,
                    letterSpacing: -1,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "꾸준히 연마해온 나의 무기들입니다.",
                  style: TextStyle(color: Colors.lightGray, fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),

          Wrap(
            spacing: 30,
            runSpacing: 40,
            children: [
              _stackItemBuilder(
                title: "Frontend",
                skills: ["Flutter", "Dart", "React", "Next.js"],
                levels: [0.95, 0.9, 0.7, 0.6],
                accentColor: Colors.blue,
              ),
              _stackItemBuilder(
                title: "Backend & DB",
                skills: ["Firebase", "Node.js", "PostgreSQL"],
                levels: [0.85, 0.65, 0.75],
                accentColor: Colors.green,
              ),
              _stackItemBuilder(
                title: "Tools & Others",
                skills: ["Git", "Figma", "Docker", "CI/CD"],
                levels: [0.9, 0.8, 0.6, 0.55],
                accentColor: Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _stackItemBuilder({
    required final String title,
    required final List<String> skills,
    required final List<double> levels,
    required final Color accentColor,
  }) => Builder(
    builder: (context) {
      return Opacity(
        opacity: progress,
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 기술 스택 대분류
              Row(
                children: [
                  // 텍스트 가운뎃 점
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: accentColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  // 텍스트
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              _stackDetailListBuilder(
                skills: skills,
                levels: levels,
                accentColor: accentColor,
              ),
            ],
          ),
        ),
      );
    },
  );

  Widget _stackDetailListBuilder({
    required final List<String> skills,
    required final List<double> levels,
    required final Color accentColor,
  }) => ListView.separated(
    itemCount: skills.length,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                skills[index],
                style: const TextStyle(color: Colors.lightGray, fontSize: 14),
              ),
              Text(
                "${(levels[index] * 100).toInt()}%",
                style: TextStyle(
                  color: accentColor.withOpacity(0.8),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Stack(
            children: [
              Container(
                height: 4,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(10),
                  borderRadius: BorderRadius.all.max,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 1500),
                height: 4,
                width: 250 * (levels[index] * progress),
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.all.max,
                  boxShadow: [
                    BoxShadow(
                      color: accentColor.withOpacity(0.3),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    },
    separatorBuilder: (_, index) {
      return SizedBox(height: 5);
    },
  );
}
