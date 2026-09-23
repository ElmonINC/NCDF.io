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

  testWidgets('routes an administrator to security controls', (
    WidgetTester tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1400, 900));
    await tester.pumpWidget(const MaterialApp(home: PersonaScreen()));
    await tester.tap(find.text('Administrator'));
    await tester.ensureVisible(find.text('Enter workspace'));
    await tester.tap(find.text('Enter workspace'));
    await tester.pumpAndSettle();
    expect(find.text('Network overview'), findsOneWidget);
    await tester.tap(find.text('Security'));
    await tester.pumpAndSettle();
    expect(find.text('Security center'), findsOneWidget);
    expect(find.text('Require MFA for privileged roles'), findsOneWidget);
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('gives founders clickable growth actions', (
    WidgetTester tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1400, 900));
    await tester.pumpWidget(const MaterialApp(home: PersonaScreen()));
    await tester.ensureVisible(find.text('Enter workspace'));
    await tester.tap(find.text('Enter workspace'));
    await tester.pumpAndSettle();
    expect(find.text('Turn your ambition into momentum.'), findsOneWidget);
    expect(find.text('Apply for funding'), findsOneWidget);
    await tester.tap(find.text('Apply for funding'));
    await tester.pump();
    expect(find.text('Opened funding application started'), findsOneWidget);
    await tester.binding.setSurfaceSize(null);
  });
}
