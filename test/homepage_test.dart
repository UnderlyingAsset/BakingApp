import 'package:bakingapp/homepage.dart';
import 'package:bakingapp/recipes_all_recipes.dart';
import 'package:bakingapp/recipes_by_category.dart';
import 'package:bakingapp/recipes_new_recipes.dart';
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
      'header image should be found on HomePage()',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: HomePage(),));
        final value = find.widgetWithImage(AppBar, const AssetImage('assets/top-bar-image.jpg'));
        expect(value, findsOneWidget);
      });

  testWidgets(
      'a button with the new-recipes-front-page image should be found on the home page',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: HomePage()));
        final value = find.widgetWithImage(IconButton, const AssetImage('assets/new-recipes-front-page.jpg'));
        expect(value, findsOneWidget);
  });

  testWidgets(
      'clicking on the new-recipe IconButton should navigate to NewRecipes()',
          (tester) async {
        await tester.pumpWidget(const MaterialApp(home: HomePage(),));
        await tester.pumpAndSettle();
        await tester.tap(find.widgetWithImage(IconButton, const AssetImage('assets/new-recipes-front-page.jpg')));
        await tester.pumpAndSettle();
        final value = find.byType(NewRecipes);
        expect(value, findsOneWidget);
      });


  testWidgets(
      'a button with the submit-recipe-front-page image should be found on the home page',
  (tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: HomePage()));
    final value = find.widgetWithImage(IconButton, const AssetImage('assets/submit-recipe-front-page.jpg'));
    expect(value, findsOneWidget);
  });

  testWidgets(
      'a button with the all-recipes image should be found on the home page',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: HomePage()));
        final value = find.widgetWithImage(IconButton, const AssetImage('assets/all-recipes.jpg'));
        expect(value, findsOneWidget);
      });

  testWidgets(
      'clicking on the all-recipe IconButton should navigate to AllRecipes()',
          (tester) async {
        await tester.pumpWidget(const MaterialApp(home: HomePage(),));
        await tester.pumpAndSettle();
        await tester.tap(find.widgetWithImage(IconButton, const AssetImage('assets/all-recipes.jpg')));
        await tester.pumpAndSettle();
        final value = find.byType(RecipesAllRecipes);
        expect(value, findsOneWidget);
      });

  testWidgets(
      'a button with the by-category-front-page image should be found on the home page',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: HomePage()));
        final value = find.widgetWithImage(IconButton, const AssetImage('assets/by-category-front-page.jpg'));
        expect(value, findsOneWidget);
      });

  testWidgets(
      'clicking on the by-category IconButton should navigate to RecipeByCategory()',
          (tester) async {
        await tester.pumpWidget(const MaterialApp(home: HomePage(),));
        await tester.pumpAndSettle();
        await tester.tap(find.widgetWithImage(IconButton, const AssetImage('assets/by-category-front-page.jpg')));
        await tester.pumpAndSettle();
        final value = find.byType(RecipeByCategory);
        expect(value, findsOneWidget);
      });

}