import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/main.dart';

void main() {
  testWidgets('PortfolioApp loads without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    expect(find.byType(PortfolioApp), findsOneWidget);
  });
}
