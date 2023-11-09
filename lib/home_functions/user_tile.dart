import 'package:flutter/material.dart';
import 'package:bakingapp/models/user_details.dart';

///This class constructs a tile which displays user information.  A list is
///made to present these tiles in the user_list.dart file.

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.user});

  final UserDetails user;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Card(
          margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: const CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage('assets/profile-page-user-image.png'),
            ),
            title: Text(user.name),
          ),
        ),
    );
  }
}

