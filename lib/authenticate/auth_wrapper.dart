import 'package:bakingapp/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:bakingapp/main_page.dart';
import 'package:provider/provider.dart';
import 'package:bakingapp/models/user.dart';

///This class returns either the home screen or authentication
///screen, depending on whether user is signed in or not.

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<NewUser?>(context);

    if (user == null) {
      return const Authenticate();
    } else {
      return const MainPage();
    }
  }
}
