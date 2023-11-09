import 'package:bakingapp/models/state_model.dart';
import 'package:bakingapp/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'authenticate/auth_wrapper.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:bakingapp/models/user.dart';

///This is the first class loaded by the app.  It uses a Stream to check whether
///a user is signed in or not, and navigates them based on the results (a logged-
///in user is navigated to the home page, and a non-logged-in user is taken to
///the sign in page).  It does this by referring to the auth_wrapper.dart file,
///which checks authentication and forwards users to the appropriate screen.

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    child: StreamProvider<NewUser?>.value(
      value: AuthService().user,
      initialData: null,
      catchError: (_,__)=>null,
      child: const MaterialApp(
        home: Wrapper(),
      ),
    ),
  )
  );
}