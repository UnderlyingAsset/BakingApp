import 'package:bakingapp/services/auth_service.dart';
import 'package:bakingapp/shared/constants.dart';
import 'package:flutter/material.dart';
import '../shared/loading.dart';

///This class represents the initial sign-in screen that displays the first
///time a user opens the application.  From here, authenticated credentials
///can be submitted to access the app, or the user can click on the "Register"
///button to go to the registration page.


class SignIn extends StatefulWidget {
  final Function switchView;
  const SignIn({super.key, required this.switchView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //A loading value which is being used to display the loading animation
  //when data is loading into the app.
  bool loading = false;

  //Variables to hold what a user writes into the email and password fields.
  String email = '';
  String password = '';
  String error = '';

  //If the loading value is true, the loading animation will be seen on screen.
  //If it is false, the Scaffold will be displayed.
  @override
  Widget build(BuildContext context) {
    return loading ? const Loading() : Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlue.shade200,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightBlue.shade200,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 120.0,
        title: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              'assets/login-page-header.jpg',
              fit: BoxFit.cover,
            )
        ),
      ),

      body: Container(
    width: 450.0,
    height: 800.0,
    padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                  'assets/bake-logo.png',
                  height: 100,
                  width: 300),
            ),
            const Center(
              child: Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Grenze',
              ),
              ),
            ),
            const Center(
              child: Text(
                'Please Sign In Here',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Grenze',
                ),
              ),
            ),
            Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 15,),
                    TextFormField(
                      validator: (val) => val!.isEmpty ? 'Fill in email.' : null,
                      onChanged: (val){
                        setState(() => email = val);
                      },
                      decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      obscureText: true,
                      validator: (val) => val!.length < 6 ? 'Enter a password at least 6 characters long.' : null,
                      onChanged: (val){
                          setState(() => password = val);
                        },
                      decoration: textInputDecoration.copyWith(hintText: 'Password'),
                    ),
                    const SizedBox(height: 18,),

                //This button takes the values entered into the TextFormFields
                //and evaluates whether they are valid (in which case they
                //are signed in and forwarded to the main screen) or if
                //their credentials are not valid, producing an error message.

                    ElevatedButton(
                      style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green.shade400),),
                      onPressed: () async {
                        if(_formKey.currentState!.validate()){
                          setState(() => loading = true);
                          dynamic result = await _auth.signInEmailPassword(email, password);
                          if(result == null) {
                            setState(() {
                              error = 'Cannot sign in with provided credentials.';
                              loading = false;
                            });
                          }
                        }
                        },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: Colors.black, fontSize: 24.0, fontFamily: 'Grenze'),
                        ),
                      ),
                    const SizedBox(height: 15,),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.green.shade400),),
                      onPressed: () async {
                        widget.switchView();
                      },
                      child: const Text(
                        'No Account? Click Here',
                        style: TextStyle(color: Colors.black, fontSize: 24.0, fontFamily: 'Grenze'),
                      ),
                    ),
                      const SizedBox(height:7.0),
                    Text(
                      error,
                      style: const TextStyle(color: Colors.red, fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
