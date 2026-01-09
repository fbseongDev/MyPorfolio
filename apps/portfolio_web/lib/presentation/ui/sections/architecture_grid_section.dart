import 'package:convention/ui.dart';
import 'package:portfolio_web/presentation/ui/details/architecture/import_convention_architecture_detail.dart';
import 'package:portfolio_web/presentation/ui/details/architecture/ltd_architecture_detail.dart';
import 'package:portfolio_web/presentation/ui/ui_model/architecture_ui_model.dart';

/// 아키텍쳐 소개 Section
class ArchitectureGridSection extends HookWidget {
  final double progress;

  const ArchitectureGridSection({super.key, required this.progress});

  List<ArchitectureUiModel> get architectures => [
    ArchitectureUiModel(
      name: 'Import Convention Architecture',
      description: '어떤 누가 개발해도 UI, Convention, Code 유지가 가능을 위한 아키텍쳐',
      detailPage: ImportConventionArchitectureDetail(),
    ),
    ArchitectureUiModel(
      name: 'LTD Architecture',
      description: 'List와 Detail의 자연스러운 상태관리를 위한 아키텍쳐',
      detailPage: LtdArchitectureDetail()
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
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
                  color: Colors.white.alpha10,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      architecture.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      architecture.description,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.thin,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          title: architecture.name,
                          builder: (context) {
                            return architecture.detailPage;
                          },
                        );
                      },
                      child: Text(
                        "View Case Study →",
                        style: TextStyle(color: Colors.lightGray),
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
