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
      'a button with the submit-recipe-cookie-brownie image should be found when user navigates to FirstSubmitPage()',
          (tester) async {
        await tester.pumpWidget(
            MaterialApp(home: RecipeCategory(addCategory: (category) {  },)));
        final value = find.widgetWithImage(IconButton, const AssetImage('assets/submit-recipe-cookie-brownie.jpg'));
        expect(value, findsOneWidget);
      });

  testWidgets(
      'a button with the submit-recipe-cakes-cupcakes image should be found when user navigates to FirstSubmitPage()',
          (tester) async {
        await tester.pumpWidget(
            MaterialApp(home: RecipeCategory(addCategory: (category) {  },)));
        final value = find.widgetWithImage(IconButton, const AssetImage('assets/submit-recipe-cakes-cupcakes.jpg'));
        expect(value, findsOneWidget);
      });

  testWidgets(
      'a button with the submit-recipe-confectionery image should be found when user navigates to FirstSubmitPage()',
          (tester) async {
        await tester.pumpWidget(
            MaterialApp(home: RecipeCategory(addCategory: (category) {  },)));
        final value = find.widgetWithImage(IconButton, const AssetImage('assets/submit-recipe-confectionery.jpg'));
        expect(value, findsOneWidget);
      });

  testWidgets(
      'a button with the submit-recipe-cakes-pies image should be found when user navigates to FirstSubmitPage()',
          (tester) async {
        await tester.pumpWidget(
            MaterialApp(home: RecipeCategory(addCategory: (category) {  },)));
        final value = find.widgetWithImage(IconButton, const AssetImage('assets/submit-recipe-pies.jpg'));
        expect(value, findsOneWidget);
      });


  //Currently non-functioning test for navigating to next page -
  //Firebase claims that there is a duplicate named project.
  // Must troubleshoot more.


  // testWidgets(
  //     'clicking on the submit-recipe-cookie-brownie button should forward users to the RecipeNameAndNoOfIngredients() page',
  //         (tester) async {
  //       await tester.pumpWidget(ChangeNotifierProvider(
  //           create: (context) => ApplicationState(),
  //           builder: (context, _) => const MaterialApp(home: FirstSubmitPage())
  //           ));
  //       await tester.pumpAndSettle();
  //       await tester.tap(find.widgetWithImage(IconButton, const AssetImage('assets/submit-recipe-front-page.jpg')));
  //       await tester.pumpAndSettle();
  //       await tester.tap(find.widgetWithImage(IconButton, const AssetImage('assets/submit-recipe-cookie-brownie.jpg')));
  //       await tester.pumpAndSettle();
  //       final value = find.byType(SecondSubmitPage);
  //       expect(value, findsOneWidget);
  //     });

}