import 'package:bakingapp/favorites.dart';
import 'package:bakingapp/profilepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

///This class is predominantly used to implement the code for the bottom
///navigation bar.  It is accessible only on the three screens featured in
///it (Profile, Home, and Favorites), and uses an index to keep track of
///which page it is currently on.


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 1;
  List bottomNavBar = [
    const ProfilePage(),
    const HomePage(),
    Favorites(userId: FirebaseAuth.instance.currentUser?.uid),
  ];
  void bottomNavTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavBar[currentIndex],
      bottomNavigationBar:
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 0,
          selectedFontSize: 0,
          onTap: bottomNavTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.black87,
          backgroundColor: Colors.green.shade400,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person, size: 65,),
            ),
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home, size: 65,),
            ),
            BottomNavigationBarItem(
              label: 'Favorites',
              icon: Icon(Icons.favorite, size: 65,),
            ),
          ],
        ),
    );
  }
}
