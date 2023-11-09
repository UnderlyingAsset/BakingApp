import 'package:bakingapp/submitpage6.dart';
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
      'return-to-home-button image should be be found on FinalSubmitPage()',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: FinalSubmitPage()));
        final value = find.widgetWithImage(IconButton, const AssetImage('assets/return-to-home.png',));
        expect(value, findsOneWidget);
      });

  testWidgets(
      'success-image image should be be found on FinalSubmitPage()',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: FinalSubmitPage()));
        final value = find.widgetWithImage(Center, const AssetImage('assets/success-image.png'));
        expect(value, findsOneWidget);
      });
}