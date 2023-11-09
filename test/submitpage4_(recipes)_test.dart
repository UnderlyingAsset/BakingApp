import 'package:bakingapp/models/recipes.dart';
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
      'one TextFormField should be found when user navigates to FourthSubmitPage()',
          (tester) async {
        await tester.pumpWidget(
            MaterialApp(home: RecipeInstructions(addInstructions: (instructions) {  })));
        final value = find.byType(TextFormField);
        expect(value, findsOneWidget);
      });

  testWidgets(
      'next-button image should be be found on FourthSubmitPage()',
          (tester) async {
        await tester.pumpWidget(
            MaterialApp(home: RecipeInstructions(addInstructions: (instructions) {  })));
        final value = find.widgetWithImage(IconButton, const AssetImage('assets/next-button-cake.png'));
        expect(value, findsOneWidget);
      });

  testWidgets(
      'back-button image should be be found on FourthSubmitPage()',
          (tester) async {
        await tester.pumpWidget(
            MaterialApp(home: RecipeInstructions(addInstructions: (instructions) {  })));
        final value = find.widgetWithImage(IconButton, const AssetImage('assets/back-button-cookie.png'));
        expect(value, findsOneWidget);
      });
}