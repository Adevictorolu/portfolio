import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/services/pinterest_service.dart';

void main() {
  testWidgets('PortfolioApp loads without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    expect(find.byType(PortfolioApp), findsOneWidget);
  });

  test('PinterestService parses RSS XML and generates smart captions', () {
    const sampleRss = '''
      <rss version="2.0">
        <channel>
          <item>
            <title>Sunday Worship Service Flyer</title>
            <link>https://www.pinterest.com/pin/123456789/</link>
            <pubDate>Sun, 15 Nov 2026 10:00:00 GMT</pubDate>
            <description>&lt;img src="https://i.pinimg.com/236x/ab/cd/ef/sample.jpg"&gt;</description>
          </item>
        </channel>
      </rss>
    ''';

    final pins = PinterestService.instance.parseFeedPayload(sampleRss);
    expect(pins.length, 1);
    expect(pins.first.id, 'pinterest-123456789');
    expect(pins.first.category, 'Church & Ministry');
    expect(pins.first.imagePath, 'https://i.pinimg.com/736x/ab/cd/ef/sample.jpg');
    expect(pins.first.caption.isNotEmpty, true);
    expect(pins.first.isFromPinterest, true);
  });
}
