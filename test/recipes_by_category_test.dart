import 'package:bakingapp/recipes_by_category.dart';
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
      'a back arrow should be found on RecipeByCategory() page',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: RecipeByCategory()));
        final value = find.widgetWithIcon(IconButton, Icons.arrow_circle_left_outlined);
        expect(value, findsOneWidget);
      });

  testWidgets(
      'header image should be found on RecipeByCategory() page',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: RecipeByCategory()));
        final value = find.widgetWithImage(AppBar, const AssetImage('assets/top-bar-image.jpg'));
        expect(value, findsOneWidget);
      });

  testWidgets(
      'a button with the submit-recipe-cookie-brownie image should be found on the RecipeByCategory()',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: RecipeByCategory()));
        final value = find.widgetWithImage(IconButton, const AssetImage('assets/submit-recipe-cookie-brownie.jpg'));
        expect(value, findsOneWidget);
      });

  testWidgets(
      'a button with the submit-recipe-cakes-cupcakes image should be found on the RecipeByCategory()',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: RecipeByCategory()));
        final value = find.widgetWithImage(IconButton, const AssetImage('assets/submit-recipe-cakes-cupcakes.jpg'));
        expect(value, findsOneWidget);
      });

  testWidgets(
      'a button with the submit-recipe-confectionery image should be found on the RecipeByCategory()',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: RecipeByCategory()));
        final value = find.widgetWithImage(IconButton, const AssetImage('assets/submit-recipe-confectionery.jpg'));
        expect(value, findsOneWidget);
      });

  testWidgets(
      'a button with the submit-recipe-pies image should be found on the RecipeByCategory()',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: RecipeByCategory()));
        final value = find.widgetWithImage(IconButton, const AssetImage('assets/submit-recipe-pies.jpg'));
        expect(value, findsOneWidget);
      });

}