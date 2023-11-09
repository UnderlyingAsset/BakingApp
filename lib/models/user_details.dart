///A class creating user objects with all the necessary details.

class UserDetails{

  final String name;

  UserDetails({required this.name});

}

class UserData {

  final String uid;
  final String name;
  String get getName => name;

  UserData({required this.uid, required this.name});
}