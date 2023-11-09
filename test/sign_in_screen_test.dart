import 'package:bakingapp/authenticate/sign_in_screen.dart';
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
      'header image should be found on SignIn() page',
          (tester) async {
        await tester.pumpWidget(
            MaterialApp(home: SignIn(switchView: () {}),));
        final value = find.widgetWithImage(AppBar, const AssetImage('assets/login-page-header.jpg'));
        expect(value, findsOneWidget);
      });

  testWidgets(
      'two TextFormFields should be found on the SignIn() page',
          (tester) async {
        await tester.pumpWidget(
            MaterialApp(home: SignIn(switchView: () {}),));
        final value = find.byType(TextFormField);
        expect(value, findsNWidgets(2));
      });

  testWidgets(
      'seven Text fields should be found on the SignIn() page',
          (tester) async {
        await tester.pumpWidget(
            MaterialApp(home: SignIn(switchView: () {}),));
        final value = find.byType(Text);
        expect(value, findsNWidgets(7));
      });

}