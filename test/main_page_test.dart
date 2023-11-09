import 'package:bakingapp/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'necessary_firebase_mock.dart';


void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets(
      'there should be a BottomNavigationBar on MainPage()',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: MainPage(),));
        final value = find.byType(BottomNavigationBar);
        expect(value, findsOneWidget);
      });

  testWidgets(
      'there should be a profile icon on MainPage() BottomNavBar',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: MainPage(),));
        final value = find.byIcon(Icons.person);
        expect(value, findsOneWidget);
      });

  testWidgets(
      'there should be a home icon on MainPage() BottomNavBar',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: MainPage(),));
        final value = find.byIcon(Icons.home);
        expect(value, findsOneWidget);
      });

  testWidgets(
      'there should be a heart icon on MainPage() BottomNavBar',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: MainPage(),));
        final value = find.byIcon(Icons.favorite);
        expect(value, findsOneWidget);
      });
}