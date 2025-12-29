import 'package:flutter_test/flutter_test.dart';

import 'package:portfolio_web/portfolio_app.dart';

void main() {
  testWidgets('PortfolioApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
  });
}
