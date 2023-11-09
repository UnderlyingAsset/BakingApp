import 'package:bakingapp/current_users.dart';
import 'package:bakingapp/home_functions/user_list.dart';
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
      'a back arrow should be found on CurrentUsers() page',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: CurrentUsers()));
        final value = find.widgetWithIcon(IconButton, Icons.arrow_circle_left_outlined);
        expect(value, findsOneWidget);
      });

  testWidgets(
      'a text box with the app name should be found on CurrentUsers() page',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: CurrentUsers()));
        final value = find.byType(Text);
        expect(value, findsOneWidget);
      });

  testWidgets(
      'the UserList() class should be found on CurrentUsers() page',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: CurrentUsers()));
        final value = find.byType(UserList);
        expect(value, findsOneWidget);
      });

}