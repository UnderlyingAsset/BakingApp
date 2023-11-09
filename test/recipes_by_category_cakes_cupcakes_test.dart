import 'package:bakingapp/recipes_by_category_cakes_cupcakes.dart';
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
      'a back arrow should be found on RecipeByCategoryCakesCupcakes() page',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: RecipeByCategoryCakesCupcakes()));
        final value = find.widgetWithIcon(IconButton, Icons.arrow_circle_left_outlined);
        expect(value, findsOneWidget);
      });

  testWidgets(
      'header image should be found on RecipeByCategoryCakesCupcakes() page',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: RecipeByCategoryCakesCupcakes()));
        final value = find.widgetWithImage(AppBar, const AssetImage('assets/top-bar-image.jpg'));
        expect(value, findsOneWidget);
      });

  testWidgets(
      'one text widget should be on RecipeByCategoryCakesCupcakes() page',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: RecipeByCategoryCakesCupcakes()));
        final value = find.byType(Text);
        expect(value, findsOneWidget);
      });

}