import 'package:bakingapp/favorites.dart';
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
      'header image should be found on Favorites() page',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: Favorites(userId: 'userId')));
        final value = find.widgetWithImage(AppBar, const AssetImage('assets/top-bar-image.jpg'));
        expect(value, findsOneWidget);
      });

  testWidgets(
      'text box should be found on Favorites() page',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: Favorites(userId: 'userId')));
        final value = find.byType(Text);
        expect(value, findsOneWidget);
      });
}