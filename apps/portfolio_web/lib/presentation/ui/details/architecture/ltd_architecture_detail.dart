import 'package:convention/ui.dart';

class LtdArchitectureDetail extends HookWidget {
  const LtdArchitectureDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '필수 사항',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        Container(padding: EdgeInsets.all(16), child: Text('')),
        SizedBox(height: 32),
        Text('목적', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Text('1. List와 Detail의 빠른 이동 및 로딩 제거'),
              Text('2. Detail의 중복 호출에 대한 비용 절감'),
              Text('3. Detail의 변화에 따른 List의 즉각 업데이트'),
            ],
          ),
        ),
        SizedBox(height: 32),
        Text('규칙', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Text(
                '1. Monorepo와 Clean Architecture를 기반으로, 실행 환경과 직접 연결되는 모듈(Runtime Layer)과 팀 공통 규칙을 적용할 모듈(Convention 모듈)을 명확히 구분한다.',
              ),
            ],
          ),
        ),
        SizedBox(height: 32),
        Text('예시', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'UI Model 코드',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 16),
              Code('''
@immutable
final class ListLtdUiModel {
  final String title;
  final DateTime dateTime;
  final Photo photoThumb;
  
  final DetailLtdUiModel detail;
  
  const ListLtdUiModel({
    required this.title,
    required this.dateTime,
    required this.photoThumb,
    
    required this.detail,
  });
}

@immutable
final class DetailLtdUiModel {
  final String content;
  final User author;
  final List<Photo> photos;
  
  const DetailLtdUiModel({
    required this.content,
    required this.author,
    required this.photos,
  });
}''', language: CodeLanguage.dart),
              SizedBox(height: 24),
              Text(
                '예시 패키지 구조',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 16),
              Package(
                node: PackageNode(
                  name: 'presentation',
                  children: [
                    PackageNode(
                      name: 'screens',
                      children: [
                        PackageNode(name: 'detail_screen.dart'),
                        PackageNode(name: 'list_screen.dart'),
                      ],
                    ),
                    PackageNode(
                      name: 'ui_models',
                      children: [PackageNode(name: 'list_ltd_ui_model.dart')],
                    ),
                    PackageNode(
                      name: 'view_models',
                      children: [PackageNode(name: 'list_ltd_view_model.dart')],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 32),
        Text('단점', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Text('1. ViewModel과 State등의 대한 기본 지식이 필요함'),
              Text('2. List와 Detail의 모든 데이터를 한 ViewModel에서 관리하여 무거워 질 수 있음'),
            ],
          ),
        ),
      ],
    );
  }
}
