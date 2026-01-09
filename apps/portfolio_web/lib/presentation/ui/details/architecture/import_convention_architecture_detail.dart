import 'package:convention/ui.dart';
import 'package:portfolio_web/presentation/ui/widgets/architecture_explain_filed.dart';

class ImportConventionArchitectureDetail extends HookWidget {
  @Preview(group: 'ImportConventionArchitectureDetail', name: 'Detail')
  const ImportConventionArchitectureDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 32,
      children: [
        _requiredContent(),
        _purposeBuilder(),
        _ruleBuilder(),
        _weaknessBuilder(),
        _exampleBuilder(),
      ],
    );
  }

  Widget _requiredContent() => ArchitectureExplainFiled.content(
    title: '필수 사항',
    content: '''
Monorepo, Clean Architecture, Design System''',
  );

  Widget _purposeBuilder() => Builder(
    builder: (context) {
      return ArchitectureExplainFiled.content(
        title: '목적',
        content: '''
1. 로직 구현 시 외부 라이브러리 선택 범위 제한

2. 표준 인터페이스의 파라미터 및 속성 제한을 통한 사용법 통제

3. 팀 공통 규칙과 디자인 시스템을 기본으로 적용하면서 사용법은 기존 인터페이스 사용법 유지

4. 신규 팀원의 빠른 적응과 일관된 코드 작성으로 DX 개선

5. 멤버 사용처 추적 및 관리 용이성 향상''',
      );
    },
  );

  Widget _ruleBuilder() => Builder(
    builder: (context) {
      return ArchitectureExplainFiled.content(
        title: '규칙',
        content: '''
1. Monorepo와 Clean Architecture를 기반으로, 실행 환경과 직접 연결되는 모듈(Runtime Layer)과 팀 공통 규칙을 적용할 모듈(Convention 모듈)을 명확히 구분한다.                

2. 실행 환경 모듈(Runtime Layer)에 의존하는 모듈은 Convention 모듈에 의존하지 않아야 한다.

3. Convention 모듈이 의존하는 모듈은 Convention 모듈에 의존하지 않아야 한다.

4. Convention 모듈을 의존하는 모듈은 외부 라이브러리에 의존하지 않아야 한다.

5. Convention 모듈은 불필요한 라이브러리에 절대 의존하지 않아야 하며, 필요한 라이브러리도 제한된 멤버만 접근 가능하도록 해야 한다.

6. Convention 모듈은 레이어별로 라이브러리 파일을 구분하여 생성한다.

7. UI 요소, 기능 함수, 메서드, 설정 객체 등 모든 멤버는 단일 책임 원칙에 따라 동일한 이름과 사용 방식을 유지한 별도 멤버로 매핑하여 사용자가 혼동 없이 동일한 방법으로 접근할 수 있도록 한다.


※ Convention 모듈에서 제공되는 모든 표준 인터페이스(Standard API)는 내부적으로 팀 공통 규칙과 디자인 시스템을 적용하도록 구현되어 있으며, 개발자는 기존 사용법 그대로 사용하기만 하면 자동으로 정책과 스타일이 적용된다.''',
      );
    },
  );

  Widget _weaknessBuilder() => Builder(
    builder: (context) {
      return ArchitectureExplainFiled.content(
        title: '단점',
        content: '''
1. Convention으로 구현된 표준 인터페이스는 기본 사용법으로도 구현이 가능하도록 설계해야 함

2. 아키텍쳐를 처음 접했을 때 표준 인터페이스의 지식이 높을수록 혼란을 겪을 수 있음''',
      );
    },
  );

  Widget _exampleBuilder() => ArchitectureExplainFiled.builder(
    title: '예시',
    builder: (context) {
      return Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Text(
                '기존 코드',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Code('''
import 'package:flutter/material.dart';

final widget = ClipRRect(
  borderRadius: BorderRadius.circular(20),
  child: BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
    child: Container(
      width: 100,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text('Hello, world!'),
    ),
  ),
);''', language: CodeLanguage.dart),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Text(
                'Import Convention Architecture 적용 코드',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Code('''
// export 'package:flutter/material.dart' show Text;
// export 'package:design_system/design_system' show Container;
import 'package:convention/ui.dart';

final widget = Container(
  width: 100,
  height: 30,
  child: Text('Hello, world!'),
);''', language: CodeLanguage.dart),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Text(
                '예시 패키지 구조',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Package(
                node: PackageNode(
                  name: 'MyPortfolio',
                  children: [
                    PackageNode(
                      name: 'apps',
                      children: [
                        PackageNode(
                          name: 'portfolio_web',
                          children: [PackageNode(name: 'main.dart')],
                        ),
                      ],
                    ),
                    PackageNode(
                      name: 'packages',
                      children: [
                        PackageNode(
                          name: 'convention',
                          children: [
                            PackageNode(name: 'app.dart'),
                            PackageNode(name: 'ui.dart'),
                          ],
                          comment: 'design_system을 의존',
                        ),
                        PackageNode(
                          name: 'design_system',
                          children: [
                            PackageNode(
                              name: 'src',
                              children: [PackageNode(name: 'container.dart')],
                            ),
                            PackageNode(name: 'design_system.dart'),
                          ],
                        ),
                      ],
                    ),
                    PackageNode(name: 'pubspecs.yaml'),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: 13, color: Colors.white),
                  children: [
                    TextSpan(
                      text: '실제 MyPortfolio 프로젝트의 패키지 구조 중 일부이며 자세한 코드는 ',
                    ),
                    TextSpan(
                      text: 'https://github.com/fbseongDev/MyPorfolio',
                      style: TextStyle(decoration: TextDecoration.underline),
                      type: TextSpanType.hyperLink,
                    ),
                    TextSpan(text: '를 참고해주세요'),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
