import 'package:bakingapp/authenticate/auth_wrapper.dart';
import 'package:flutter/material.dart';

///This file represents the final page users encounter during the recipe
///submission process, but does not submit any data itself.  Rather, it is a
///confirmation page at having completed the process of submitting a recipe,
///and alerts the user that their recipe will be available on the app soon.
///The user can then navigate to the home page through a "return to home"
///button at the bottom of the screen.

class FinalSubmitPage extends StatelessWidget {
  const FinalSubmitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'assets/top-bar-image.jpg',
              fit: BoxFit.cover,
            )
        ),
      ),


      body: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 520.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset('assets/success-image.png',
                    height: 163.0,
                    width: 163.0,
                  ),
                ),
                const Spacer(flex: 3),
                const SizedBox(
                  child: Center(
                    child: Text(
                      'Recipe successfully submitted!',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                ),
                const Spacer(flex:1,),
                const SizedBox(
                  child: Center(
                    child: Text(
                      'It will be live on the app within a few hours.',
                      style: TextStyle(
                        fontSize: 23.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                ),
                const Spacer(flex:2,),
                const SizedBox(
                  child: Center(
                    child: Text(
                      'Thank you for your contribution!',
                      style: TextStyle(
                        fontSize: 23.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1,),
                SizedBox(
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return const Wrapper(); }),);
                        },
                        icon: Image.asset('assets/return-to-home.png',),
                        iconSize: 153.0,
                        style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0),),),),
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
