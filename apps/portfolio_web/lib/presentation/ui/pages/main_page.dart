import 'package:flutter/material.dart';

import '../heroes/main_hero.dart';

/// 메인 페이지
///
/// 전체적인 구조와 스크롤의 기본 배경을 담당하는 page
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // [MainPage]의 페이지 전체의 스크롤을 담당
  final ScrollController _scrollController = ScrollController();

  // [_scrollController]의 offest
  double _offset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() => setState(() => _offset = _scrollController.offset));
  }

  // 현재 스크롤 비율을 계산
  double getProgress(double start, double end) {
    return ((_offset - start) / (end - start)).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              MainHero(progress: getProgress(0, 500)),

              const SizedBox(height: 300),
            ],
          ),
        ),
      ],
    );
  }
}