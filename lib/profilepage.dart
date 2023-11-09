import 'package:bakingapp/home_functions/settings_form.dart';
import 'package:bakingapp/services/auth_service.dart';
import 'package:bakingapp/services/databases.dart';
import 'package:bakingapp/user_recipes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'current_users.dart';
import 'models/user_details.dart';

///This file represents the profile page that a user can click into from the
///bottom navigation bar.  There is functionality for a user to view their
///own recipes, see the current users, change their name, and log out.  There
///is also a "My Ratings" button which currently doesn't have functionality
///because there is no review system in place.


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthService _auth = AuthService();
  String? currentUsername = FirebaseAuth.instance.currentUser?.displayName.toString();

  getCurrentUsername() {
    return currentUsername;
  }

  @override
  Widget build(BuildContext context) {

    void showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          color: Colors.lightBlue.shade200,
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: const SettingsForm(),
        );
      });
    }

    //This stream allows developers to see the information for the current user
    //who is signed in to the app.

    return StreamProvider<List<UserDetails>>.value(
        value: DatabaseService(uid: '').usersData,
    initialData: const [],
    child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlue.shade200,


      //The "settings" icon in the AppBar is referenced here, and the
      //functionality of it occurs in the settings_form.dart file.
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightBlue.shade200,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 120.0,
        title: Text(
          'Bake!',
          style: TextStyle(
            fontFamily: 'Candy',
            fontSize: 60.0,
            color: Colors.green.shade400,
          ),
        ),
        actions: [
          TextButton.icon(
            label: const Text(
                'Settings',
            style: TextStyle(fontSize: 16.0)),
            icon: const Icon(
                Icons.settings,
              size: 35.0,
            ),
            onPressed: () => showSettingsPanel(),
          ),
        ],
      ),

        body:  Container(
        width: 450.0,
        padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                  'assets/profile-page-user-image.png',
                  height: 110.0,
                  width: 110.0,),
                  ),
                SizedBox(
                  height: 50.0,
                  child: Center(
                    child: Text(

                      '$currentUsername',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 15.0,
              top: 142.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(65.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return const UsersRecipes(); }),);
                  },
                  icon: Image.asset('assets/profile-page-my-recipes.jpg',),
                  iconSize: 140.0,
                ),
              ),
            ),
            Positioned(
              right: 15.0,
              top: 142.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(65.0),
                child: IconButton(
                  onPressed: null,
                  icon: Image.asset('assets/profile-page-my-ratings.jpg',),
                  iconSize: 140.0,
                ),

              ),
            ),
            Positioned(
              left: 15.0,
              top: 287.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(65.0),
                child: IconButton(
                  onPressed: () async {
                    await _auth.signOutMethod();
                  },
                  icon: Image.asset('assets/profile-page-logout.jpg',),
                  iconSize: 140.0,
                ),

              ),
            ),
            Positioned(
              right: 15.0,
              top: 287.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(65.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return const CurrentUsers(); }),);
                  },
                  icon: Image.asset('assets/current-users.png',),
                  iconSize: 140.0,
                ),
              ),
            ),
          ],
        ),
       ),
      ),
    );
  }
}
