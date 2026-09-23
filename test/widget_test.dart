// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ncdf_app/main.dart';

void main() {
  testWidgets('shows NCDF sign-in screen', (WidgetTester tester) async {
    await tester.pumpWidget(const NcdfApp());
    expect(find.text('Welcome back'), findsOneWidget);
    expect(find.text('Sign in'), findsOneWidget);
  });

  testWidgets('shows only the administrator persona for admin logins', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: PersonaScreen(email: 'admin@ncdf.io')),
    );
    expect(find.text('Administrator'), findsOneWidget);
    expect(find.text('Founder'), findsNothing);
    expect(find.text('Investor'), findsNothing);
    expect(find.text('Mentor'), findsNothing);
    expect(find.text('Partner'), findsNothing);
  });

  testWidgets('shows standard client personas for non-admin users', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: PersonaScreen(email: 'alex@ncdf.io')),
    );
    expect(find.text('Founder'), findsOneWidget);
    expect(find.text('Administrator'), findsNothing);
    expect(find.text('Standard access'), findsOneWidget);
  });

  testWidgets('routes an admin to the admin control center', (
    WidgetTester tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1400, 900));
    await tester.pumpWidget(
      const MaterialApp(home: PersonaScreen(email: 'admin@ncdf.io')),
    );
    await tester.tap(find.text('Administrator'));
    await tester.pumpAndSettle();
    expect(find.text('Administration center'), findsOneWidget);
    expect(find.text('Institution control'), findsOneWidget);
    expect(find.text('User control'), findsOneWidget);
    await tester.tap(find.text('Security'));
    await tester.pumpAndSettle();
    expect(find.text('Security center'), findsOneWidget);
    await tester.binding.setSurfaceSize(null);
  });
}
