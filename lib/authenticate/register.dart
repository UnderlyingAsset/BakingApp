import 'package:flutter/material.dart';
import 'package:bakingapp/services/auth_service.dart';
import 'package:bakingapp/shared/constants.dart';
import '../shared/loading.dart';

///This class represents the register page that a user must use when
///they do not have an account for the application.  This includes the
///creation of the user in the database.


class Register extends StatefulWidget {

  final Function switchView;
  const Register({super.key, required this.switchView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //A loading value which is being used to display the loading animation
  //when data is loading into the app.
  bool loading = false;

  //Variables to hold what a user writes into the email and password
  String email = '';
  String password = '';
  String error = '';

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
                'Please Register Your Email and Password',
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

                //These TextFormFields allow user to enter in emails and
                //passwords, and checks to make sure they meet the conditions
                //of valid emails/passwords.
                    TextFormField(
                      validator: (val) => val!.isEmpty ? 'Fill in email.' : null,
                      onChanged: (val){
                          setState(() => email = val);
                        },
                      decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      validator: (val) => val!.length < 6 ? 'Enter a password at least 6 characters long.' : null,
                        obscureText: true,
                        onChanged: (val){
                          setState(() => password = val);
                        },
                      decoration: textInputDecoration.copyWith(hintText: 'Password (6 Character Minimum)'),
                    ),
                    const SizedBox(height: 0.0,),
                    Text(
                      error,
                      style: const TextStyle(color: Colors.red, fontSize: 15.0),
                    ),

                //This button takes the values entered into the TextFormFields
                //and evaluates whether they are valid (in which case they
                //become a user and are forwarded to the main screen) or if
                //there was an error, resulting in an error message.
                    ElevatedButton(
                      style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green.shade400),
                      ),
                      onPressed: () async {
                        if(_formKey.currentState!.validate()){
                          setState(() => loading = true);
                          dynamic result = await _auth.registerEmailPassword(email, password);
                          if(result == null) {
                            setState(() {
                              error = 'Something is invalid.';
                              loading = false;
                            });
                          }
                        }
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.black, fontSize: 24.0, fontFamily: 'Grenze'),
                      ),
                    ),
                    const SizedBox(height: 13,),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.green.shade400),),
                        onPressed: () {widget.switchView();
                      },
                      child: const Text(
                        'Return to Sign In',
                        style: TextStyle(color: Colors.black, fontSize: 24.0, fontFamily: 'Grenze'),
                      ),
                    ),
                    const SizedBox(height: 10.0),

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
