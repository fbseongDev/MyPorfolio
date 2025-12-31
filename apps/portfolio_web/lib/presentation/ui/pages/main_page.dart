import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/presentation/ui/widgets/project_grid_section.dart';

import '../heroes/main_hero.dart';
import '../widgets/glass_feature_section.dart';

/// 메인 페이지
///
/// 전체적인 구조와 스크롤의 기본 배경을 담당하는 page
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  final ScrollController _scrollController = ScrollController();
  double _offset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() => setState(() => _offset = _scrollController.offset));
  }

  double getProgress(double start, double end) {
    return ((_offset - start) / (end - start)).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -100 - (_offset * 0.2),
          left: -100,
          child: AmbientCircle(color: Colors.blue.withOpacity(0.2), size: 400),
        ),
        Positioned(
          bottom: 100 + (_offset * 0.1),
          right: -50,
          child: AmbientCircle(color: Colors.purple.withOpacity(0.2), size: 300),
        ),
        SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              MainHero(progress: getProgress(0, 500)),
              GlassFeatureSection(progress: getProgress(300, 800)),
              ProjectGridSection(progress: getProgress(800, 1400)),
              const SizedBox(height: 300),
            ],
          ),
        ),
      ],
    );
  }
}