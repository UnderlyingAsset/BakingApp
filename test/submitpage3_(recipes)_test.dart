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
      'thirty TextFormFields should be found when user navigates to ThirdSubmitPage()',
          (tester) async {
        await tester.pumpWidget(
            MaterialApp(home: IngredientNameQuantityUnit(addIngredients: (addIngredients) {}, addQuantities: (addQuantities) {}, addUnits: (addUnits) {})));
        final value = find.byType(TextFormField);
        expect(value, findsNWidgets(30));
      });

  testWidgets(
      'fifteen DropdownButtons should be found when user navigates to ThirdSubmitPage()',
          (tester) async {
        await tester.pumpWidget(
            MaterialApp(home: IngredientNameQuantityUnit(addIngredients: (addIngredients) {}, addQuantities: (addQuantities) {}, addUnits: (addUnits) {})));
        final value = find.byType(DropdownButton<String>);
        expect(value, findsNWidgets(15));
      });

  testWidgets(
      'next-button image should be be found on ThirdSubmitPage()',
          (tester) async {
        await tester.pumpWidget(
            MaterialApp(home: IngredientNameQuantityUnit(addIngredients: (addIngredients) {}, addQuantities: (addQuantities) {}, addUnits: (addUnits) {})));
        final value = find.widgetWithImage(IconButton, const AssetImage('assets/next-button-cake.png'));
        expect(value, findsOneWidget);
      });

  testWidgets(
      'back-button image should be be found on ThirdSubmitPage()',
          (tester) async {
        await tester.pumpWidget(
            MaterialApp(home: IngredientNameQuantityUnit(addIngredients: (addIngredients) {}, addQuantities: (addQuantities) {}, addUnits: (addUnits) {})));
        final value = find.widgetWithImage(IconButton, const AssetImage('assets/back-button-cookie.png'));
        expect(value, findsOneWidget);
      });
}