import 'package:convention/ui.dart';

/// 특기 소개 Section
class CapabilitiesSection extends StatelessWidget {
  final double progress;

  const CapabilitiesSection({super.key, required this.progress});

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
              _capabilitiesCardBuilder(
                title: "Smooth\nAnimations",
                icon: Icons.auto_awesome,
              ),
              _capabilitiesCardBuilder(
                title: "Clean\nArchitecture",
                icon: Icons.architecture,
              ),
              _capabilitiesCardBuilder(
                title: "Fast\nPerformance",
                icon: Icons.bolt,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _capabilitiesCardBuilder({
    required final String title,
    required final IconData icon,
  }) => Builder(
    builder: (context) {
      return Opacity(
        opacity: progress,
        child: Container(
          width: 160,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.blue),
              const SizedBox(height: 15),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    },
  );
}
