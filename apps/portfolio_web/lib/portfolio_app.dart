import 'package:flutter/material.dart';
import 'package:portfolio_web/presentation/ui/pages/intro_page.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const IntroPage(),
    );
  }
}
