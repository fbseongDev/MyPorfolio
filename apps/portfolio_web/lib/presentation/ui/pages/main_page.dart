import 'package:convention/ui.dart';
import 'package:portfolio_web/presentation/ui/sections/architecture_grid_section.dart';
import 'package:portfolio_web/presentation/ui/sections/project_grid_section.dart';

import '../heroes/main_hero.dart';
import '../sections/capabilities_section.dart';
import '../sections/skill_stack_section.dart';

/// 메인 페이지
///
/// 전체적인 구조와 스크롤의 기본 배경을 담당하는 page
class MainPage extends HookWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final offset = useState<double>(0);

    double getProgress(final double start, final double end) {
      return ((offset.value - start) / (end - start)).clamp(0.0, 1.0);
    }

    useEffect(() {
      void listener() {
        offset.value = scrollController.offset;
      }

      scrollController.addListener(listener);

      return () {
        scrollController.removeListener(listener);
      };
    }, []);

    return Stack(
      children: [
        Positioned(
          top: -100 - (offset.value * 0.2),
          left: -100,
          child: AmbientCircle(color: Colors.blue.alpha10, size: 400),
        ),
        Positioned(
          bottom: 100 + (offset.value * 0.1),
          right: -50,
          child: AmbientCircle(
            color: Colors.purple.alpha10,
            size: 300,
          ),
        ),
        SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              MainHero(progress: getProgress(0, 500)),
              CapabilitiesSection(progress: getProgress(300, 800)),
              SkillStackSection(progress: getProgress(600, 1000)),
              ProjectGridSection(progress: getProgress(800, 1400)),
              ArchitectureGridSection(progress: getProgress(800, 1400)),
              const SizedBox(height: 300),
            ],
          ),
        ),
      ],
    );
  }
}
