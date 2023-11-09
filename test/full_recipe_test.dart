import 'package:bakingapp/models/full_recipe.dart';
import 'package:bakingapp/services/recipe_services.dart';
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
      'a back arrow should be found on FullRecipeDisplay() page',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: FullRecipeDisplay(recipeId: 'recipeId'),));
        final value = find.widgetWithIcon(IconButton, Icons.arrow_circle_left_outlined);
        expect(value, findsOneWidget);
      });

  testWidgets(
      'header image should be found on FullRecipeDisplay()',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: FullRecipeDisplay(recipeId: 'recipeId'),));
        final value = find.widgetWithImage(AppBar, const AssetImage('assets/top-bar-image.jpg'));
        expect(value, findsOneWidget);
      });

  testWidgets(
      'there should be a TabBarView on FullRecipeDisplay()',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: FullRecipeDisplay(recipeId: 'recipeId'),));
        final value = find.byType(TabBarView);
        expect(value, findsOneWidget);
      });

  testWidgets(
      'a class which brings in the recipe name should be on FullRecipeDisplay()',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: FullRecipeDisplay(recipeId: 'recipeId'),));
        final value = find.byType(GetRecipeName);
        expect(value, findsOneWidget);
      });

  testWidgets(
      'a class which brings in the username of the person who submitted the recipe should be on FullRecipeDisplay()',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: FullRecipeDisplay(recipeId: 'recipeId'),));
        final value = find.byType(GetUserNameForRecipe);
        expect(value, findsOneWidget);
      });

  testWidgets(
      'a class which brings in the recipe image should be on FullRecipeDisplay()',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: FullRecipeDisplay(recipeId: 'recipeId'),));
        final value = find.byType(GetRecipeImage);
        expect(value, findsOneWidget);
      });

  testWidgets(
      'a heart icon button should be found on FullRecipeDisplay() page',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: FullRecipeDisplay(recipeId: 'recipeId'),));
        final value = find.widgetWithIcon(IconButton, Icons.favorite_border_outlined);
        expect(value, findsOneWidget);
      });

  testWidgets(
      'the heart icon on FullRecipeDisplay() should change when clicked',
          (tester) async {
        await tester.pumpWidget(const MaterialApp(home: FullRecipeDisplay(recipeId: 'recipeId'),));
        await tester.pumpAndSettle();
        await tester.tap(find.widgetWithIcon(IconButton, Icons.favorite_border_outlined));
        await tester.pumpAndSettle();
        final value = find.widgetWithIcon(IconButton, Icons.favorite);
        expect(value, findsOneWidget);
      });

  testWidgets(
      'there should be a TabBar on FullRecipeDisplay()',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: FullRecipeDisplay(recipeId: 'recipeId'),));
        final value = find.byType(TabBar);
        expect(value, findsOneWidget);
      });

  testWidgets(
      'the TabBar should have three tabs on FullRecipeDisplay()',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: FullRecipeDisplay(recipeId: 'recipeId'),));
        final value = find.byType(Tab);
        expect(value, findsNWidgets(3));
      });

  testWidgets(
      'a class which brings in recipe ingredients, quantities, and units should be on FullRecipeDisplay()',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: FullRecipeDisplay(recipeId: 'recipeId'),));
        final value = find.byType(GetRecipeIngredientsQuantitiesUnits);
        expect(value, findsOneWidget);
      });

  testWidgets(
      'a class which brings in recipe instructions should be on FullRecipeDisplay()',
          (tester) async {
        await tester.pumpWidget(const MaterialApp(home: FullRecipeDisplay(recipeId: 'recipeId'),));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Instructions'));
        await tester.pumpAndSettle();
        final value = find.byType(GetRecipeInstructions);
        expect(value, findsOneWidget);
      });

  testWidgets(
      'a class which brings in recipe notes should be on FullRecipeDisplay()',
          (tester) async {
        await tester.pumpWidget(const MaterialApp(home: FullRecipeDisplay(recipeId: 'recipeId'),));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Notes'));
        await tester.pumpAndSettle();
        final value = find.byType(GetRecipeNotes);
        expect(value, findsOneWidget);
      });
}