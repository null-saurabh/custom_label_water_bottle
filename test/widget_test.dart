import 'package:cwbl_website/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App builds without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const BrandedWaterApp());
    expect(find.byType(BrandedWaterApp), findsOneWidget);
  });
}
