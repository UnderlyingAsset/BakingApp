import 'package:bakingapp/home_functions/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_details.dart';


///This class is used to construct a list of Users currently registered to the
///app, which is a list which can be accessed from the profile screen.
///This class would eventually serve as a "view all members" feature, although
///at the moment it is just useful for the developer to easily see the currently
///registered users.  The structure for each tile in the list can be found in
///the user_tile.dart file.

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {

    final usersData = Provider.of<List<UserDetails>>(context);


    return ListView.builder(
      itemCount: usersData.length,
      itemBuilder: (context, index) {
        return UserTile(user: usersData[index]);
      },
    );
  }
}
