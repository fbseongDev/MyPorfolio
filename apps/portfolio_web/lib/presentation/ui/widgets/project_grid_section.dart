import 'package:convention/ui.dart';

/// 프로젝트 소개 Section
class ProjectGridSection extends StatelessWidget {
  final double progress;

  const ProjectGridSection({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Featured Works",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
                _projectItemBuilder(index: index, progress: progress),
          ),
        ],
      ),
    );
  }

  Widget _projectItemBuilder({
    required final int index,
    required final double progress,
  }) => Builder(
    builder: (context) {
      return Opacity(
        opacity: progress,
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          height: 250,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                right: -20,
                bottom: -20,
                child: Icon(
                  Icons.app_shortcut,
                  size: 200,
                  color: Colors.white.withOpacity(0.03),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Project 0${index + 1}",
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "혁신적인 UI/UX 프로젝트",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "View Case Study →",
                        style: TextStyle(color: Colors.lightGray),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
