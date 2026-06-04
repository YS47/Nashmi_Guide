import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nashmi_guide/main.dart';

void main() {
  testWidgets('App launches and shows bottom navigation bar', (WidgetTester tester) async {
    await tester.pumpWidget(const ExploreJordanApp());
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}
