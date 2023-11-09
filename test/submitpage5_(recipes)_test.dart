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
      'two TextFormFields should be found when user navigates to FifthSubmitPage()',
          (tester) async {
        await tester.pumpWidget(
            MaterialApp(home: RecipeNotesAndImage(addNotes: (addNotes) {}, addImage: (addImage) {})));
        final value = find.byType(TextFormField);
        expect(value, findsNWidgets(2));
      });

  testWidgets(
      'submit-final-button image should be be found on FifthSubmitPage()',
          (tester) async {
        await tester.pumpWidget(
            MaterialApp(home: RecipeNotesAndImage(addNotes: (addNotes) {}, addImage: (addImage) {})));
        final value = find.widgetWithImage(IconButton, const AssetImage('assets/submit-final-button.png'));
        expect(value, findsOneWidget);
      });

  testWidgets(
      'back-button image should be be found on FifthSubmitPage()',
          (tester) async {
        await tester.pumpWidget(
            MaterialApp(home: RecipeNotesAndImage(addNotes: (addNotes) {}, addImage: (addImage) {})));
        final value = find.widgetWithImage(IconButton, const AssetImage('assets/back-button-cookie.png'));
        expect(value, findsOneWidget);
      });
}