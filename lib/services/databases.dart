import 'package:bakingapp/models/user_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


///This class and the methods therein are responsible for setting user data in the
///database and fetching it as necessary.

  class DatabaseService {

    final String uid;
    DatabaseService({ required this.uid });

    //This is the collection reference for the collection of users.
    final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

    //This method is used in the register.dart file to initially create a new
    //document containing a username, email, and userId field, but it is also
    //used to update the name of the signed-in user, within the settings_form.dart
    //file (users cannot update their email or Id).

    Future updateUserData(String name, String email, List<String> favorites) async {
      return await userCollection.doc(uid).set({
        'name': name,
        'userId': FirebaseAuth.instance.currentUser!.uid,
        'email': email,
        'favorites': favorites,
      });
    }

    //This is a list of users from a database snapshot.

    List<UserDetails> _userDetailsFromSnapshot(QuerySnapshot snapshot) {
      return snapshot.docs.map((doc){
        return UserDetails(
          name: doc.get('name') ?? '',
        );
      }).toList();
    }

    //This is the UserData we retrieve from a specific document.

    UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
      return UserData(
          uid: uid,
          name: snapshot.get('name'));
    }

    //This method allows developers to get the user data stream.
    Stream<List<UserDetails>> get usersData {
      return userCollection.snapshots()
        .map(_userDetailsFromSnapshot);
  }


    //This final method is for the User document stream.
  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots()
        .map(_userDataFromSnapshot);
  }
}