import 'package:flutter/material.dart';
import 'package:portfolio_web/presentation/pages/main_page.dart';

import '../helpers/intro_hero.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool introDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1200),
        switchInCurve: Curves.easeInOutQuart,
        child: introDone
            ? const MainPage(key: ValueKey('portfolio'))
            : IntroHero(
          key: const ValueKey('intro'),
          onFinish: () => setState(() => introDone = true),
        ),
      ),
    );
  }
}