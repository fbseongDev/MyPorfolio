import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart' hide Container, Opacity;
import 'package:portfolio_web/presentation/ui/details/architecture/import_convention_architecture_detail.dart';
import 'package:portfolio_web/presentation/ui/ui_model/architecture_ui_model.dart';

/// 아키텍쳐 소개 Section
class ArchitectureGridSection extends StatelessWidget {
  final double progress;

  const ArchitectureGridSection({super.key, required this.progress});

  List<ArchitectureUiModel> get architectures => [
    ArchitectureUiModel(
      name: 'Import Convention Architecture',
      description: '어떤 누가 개발해도 UI, Convention, Code 유지가 가능을 위한 아키텍쳐',
      detailPage: ImportConventionArchitectureDetail(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Featured Architecture",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          _projectListBuilder(progress: progress, architectures: architectures),
        ],
      ),
    );
  }

  Widget _projectListBuilder({
    required final double progress,
    required final List<ArchitectureUiModel> architectures,
  }) => ListView.builder(
    itemCount: architectures.length,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      final architecture = architectures[index];

      return Opacity(
        opacity: progress,
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                right: -20,
                top: -20,
                child: Icon(
                  Icons.architecture,
                  size: 100,
                  color: Colors.white.withOpacity(0.03),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      architecture.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      architecture.description,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextButton(
                      onPressed: () {

                      },
                      child: const Text(
                        "View Case Study →",
                        style: TextStyle(color: Colors.white70),
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
