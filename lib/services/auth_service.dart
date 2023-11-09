import 'package:bakingapp/services/databases.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bakingapp/models/user.dart';

///This class (and functions therein) serve to authenticate all users of the
///applications.


class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;


  //This creates a new User object for the User? class
  NewUser? _userFromUserClass (User? user) {
    return user != null ? NewUser(uid: user.uid) : null;
  }


  //This is a stream to deal with changes in authentication for users of the app.

  Stream<NewUser?> get user{
    return _auth.authStateChanges().map((User? user) => _userFromUserClass(user));
  }



  //A method which allows existing users to sign-in with EM/PW.

  Future signInEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromUserClass(user);
    } catch(e) {
      return null;
    }
  }



  //A method which allows a new user to register with EM/PW.

Future registerEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      //Create a new document for the user with the uid
      await DatabaseService(uid: user!.uid).updateUserData('New User', email, []);
      return _userFromUserClass(user);
    } catch(e) {
      return null;
    }
}



  //This method allows users who are currently signed in to sign out.

  Future signOutMethod() async {
    try{
    return await _auth.signOut();
    } catch(e){
      return null;
    }
  }
}