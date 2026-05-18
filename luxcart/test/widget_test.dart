// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:luxcart/main.dart';



void main() {
  testWidgets('LuxCart dashboard smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our e-commerce dashboard loaded successfully.
    expect(find.text('TRENDORA'), findsOneWidget);
    expect(find.text('Hello Tavorian'), findsOneWidget);
    expect(find.text('Trending'), findsOneWidget);
  });
}

