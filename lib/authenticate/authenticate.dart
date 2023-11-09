import 'package:bakingapp/authenticate/register.dart';
import 'package:bakingapp/authenticate/sign_in_screen.dart';
import 'package:flutter/material.dart';


///This class is called by the auth_wrapper when a user is not signed in.
///It defaults to the sign-in page, but the function 'switchView' (accessed
/// in both the sign in and register pages) allows users to switch between
///the two screens.

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool signInStatus = true;
  void switchView() {
    setState(() => signInStatus = !signInStatus);
  }

  @override
  Widget build(BuildContext context) {
    if (signInStatus) {
      return SignIn(switchView: switchView);
    } else{
      return Register(switchView: switchView);
    }
  }
}
