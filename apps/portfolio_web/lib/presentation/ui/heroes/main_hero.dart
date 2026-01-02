import 'package:convention/ui.dart';

class MainHero extends HookWidget {
  final double progress;
  const MainHero({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 1 + (progress * 0.5),
              child: Opacity(
                opacity: (1 - progress),
                child: const Text(
                  "Code is Art\nExperience is Everything",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, height: 1.1),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Icon(Icons.keyboard_arrow_down, color: Colors.white.withOpacity(1 - progress), size: 40),
          ],
        ),
      ),
    );
  }
}