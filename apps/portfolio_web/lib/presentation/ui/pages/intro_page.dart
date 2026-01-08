import 'package:convention/ui.dart';

import '../heroes/intro_hero.dart';
import 'main_page.dart';

/// 접속후 첫 페이지
///
/// 사이트 로딩 애니메이션 구현
class IntroPage extends HookWidget {
  const IntroPage({super.key});


  @override
  Widget build(BuildContext context) {
  final introDone = useState(false);
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1200),
        switchInCurve: Curves.easeInOutQuart,
        child: introDone.value
            ? const MainPage(key: ValueKey('portfolio'))
            : IntroHero(
          key: const ValueKey('intro'),
          onFinish: () =>  introDone.value = true,
        ),
      ),
    );
  }
}