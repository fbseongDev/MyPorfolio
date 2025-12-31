import 'package:flutter/material.dart';
import 'package:portfolio_web/presentation/helpers/main_hero.dart';

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