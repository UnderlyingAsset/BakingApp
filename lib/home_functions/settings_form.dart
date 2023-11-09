import 'package:bakingapp/models/user_details.dart';
import 'package:bakingapp/services/databases.dart';
import 'package:bakingapp/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bakingapp/shared/constants.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';

///This form is accessed from the profilepage.dart file, and allows a user
///to update their username within the database after entering in a new
///name and clicking the ElevatedButton labelled "Update."

    class SettingsForm extends StatefulWidget {
      const SettingsForm({super.key});

      @override
      State<SettingsForm> createState() => _SettingsFormState();
    }
    
    class _SettingsFormState extends State<SettingsForm> {

      final _formKey = GlobalKey<FormState>();

      //form values
      String _currentName = '';

      @override
      Widget build(BuildContext context) {

        final user = Provider.of<NewUser?>(context);

        return StreamBuilder<UserData>(
          stream: DatabaseService(uid: user!.uid).userData,
          builder: (context, snapshot) {
            if(snapshot.hasData){

              UserData? userData = snapshot.data;

              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      'Update your name:',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      initialValue: userData?.name,
                      decoration: textInputDecoration,
                      validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
                      onChanged: (val) => setState(() => _currentName = val),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.green),
                      ),

                      onPressed: () async {
                        if(_formKey.currentState!.validate()) {
                          await DatabaseService(uid: user.uid).updateUserData(
                              _currentName,
                              FirebaseAuth.instance.currentUser!.email!,
                              []);
                          FirebaseAuth.instance.currentUser!.updateDisplayName(_currentName);
                          if (mounted) Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),

                    ),
                  ],
                ),
              );
            } else{
              return const Loading();
            }
          }
        );
      }
    }
    