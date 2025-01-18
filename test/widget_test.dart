// This is a comprehensive Flutter widget test file that demonstrates various testing techniques
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sirenai/main.dart';

void main() {
  group('MyApp Widget Tests', () {
    testWidgets('Counter starts at 0 and increments correctly', (WidgetTester tester) async {
      // Build our app and trigger a frame
      await tester.pumpWidget(const MyApp());

      // Verify initial state
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Tap the '+' icon and trigger a frame
      await tester.tap(find.byIcon(Icons.add));
      // Rebuild the widget after the state has changed
      await tester.pump();

      // Verify the counter has incremented
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('App bar title is correct', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      
      // Find the app bar title
      expect(find.text('Flutter Demo Home Page'), findsOneWidget);
    });

    testWidgets('Floating action button is present', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      
      // Verify FAB exists and has the correct icon
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('Multiple counter increments work correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Tap multiple times
      for (var i = 0; i < 3; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();
      }

      // Verify the counter shows 3
      expect(find.text('3'), findsOneWidget);
    });
  });
}
