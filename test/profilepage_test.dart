import 'package:bakingapp/home_functions/user_list.dart';
import 'package:bakingapp/profilepage.dart';
import 'package:bakingapp/user_recipes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'necessary_firebase_mock.dart';


void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
    WidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets(
      'three text boxes should be found on ProfilePage()',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: ProfilePage()));
        final value = find.byType(Text);
        expect(value, findsNWidgets(3));
      });

  testWidgets(
      'a settings icon should be found on ProfilePage()',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: ProfilePage()));
        final value = find.byIcon(Icons.settings);
        expect(value, findsOneWidget);
      });

  testWidgets(
      'a button with the my-recipes image should be found on the ProfilePage() screen',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: ProfilePage()));
        final value = find.widgetWithImage(IconButton, const AssetImage('assets/profile-page-my-recipes.jpg'));
        expect(value, findsOneWidget);
      });

  testWidgets(
      'clicking on the my-recipe IconButton should navigate to UsersRecipes()',
          (tester) async {
        await tester.pumpWidget(const MaterialApp(home: ProfilePage(),));
        await tester.pumpAndSettle();
        await tester.tap(find.widgetWithImage(IconButton, const AssetImage('assets/profile-page-my-recipes.jpg')));
        await tester.pumpAndSettle();
        final value = find.byType(UsersRecipes);
        expect(value, findsOneWidget);
      });

  testWidgets(
      'a button with the my-ratings image should be found on the ProfilePage() screen',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: ProfilePage()));
        final value = find.widgetWithImage(IconButton, const AssetImage('assets/profile-page-my-ratings.jpg'));
        expect(value, findsOneWidget);
      });

  testWidgets(
      'a button with the logout image should be found on the ProfilePage() screen',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: ProfilePage()));
        final value = find.widgetWithImage(IconButton, const AssetImage('assets/profile-page-logout.jpg'));
        expect(value, findsOneWidget);
      });



  testWidgets(
      'a button with the current-users image should be found on the ProfilePage() screen',
          (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: ProfilePage()));
        final value = find.widgetWithImage(IconButton, const AssetImage('assets/current-users.png'));
        expect(value, findsOneWidget);
      });

  testWidgets(
      'clicking on the current IconButton should navigate to UserList()',
  (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProfilePage(),));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithImage(IconButton, const AssetImage('assets/current-users.png')));
    await tester.pumpAndSettle();
    final value = find.byType(UserList);
    expect(value, findsOneWidget);
  });
}