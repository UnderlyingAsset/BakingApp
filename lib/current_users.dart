import 'package:bakingapp/services/databases.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_functions/user_list.dart';
import 'models/user_details.dart';


///This is a page which presents all registered users as a list of tiles.  These
///are taken from the user_list.dart and user_tile.dart files.


class CurrentUsers extends StatefulWidget {
  const CurrentUsers({super.key});

  @override
  State<CurrentUsers> createState() => _CurrentUsersState();
}

class _CurrentUsersState extends State<CurrentUsers> {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<UserDetails>>.value(
      value: DatabaseService(uid: '').usersData,
      initialData: const [],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.lightBlue.shade200,

        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_circle_left_outlined,),
            color: Colors.black,
            iconSize: 40.0,
          ),
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
        ),

        body: const UserList()
      ),
    );
  }
}
