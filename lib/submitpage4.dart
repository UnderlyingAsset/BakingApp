import 'package:bakingapp/models/recipes.dart';
import 'package:bakingapp/models/state_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///This file represents the fourth step of the recipe submission process, and works
///in tandem with the recipes.dart file (which holds the layout of the page) and
///the state_model.dart file (which holds the method to submit fields to
///Firebase).  Those two files come together in the body of this class and submit
///the recipe instructions field to the recipe document in the database.

class FourthSubmitPage extends StatelessWidget {
  const FourthSubmitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlue.shade200,

      body: Consumer<ApplicationState>(
      builder: (context, appState, _) => SizedBox(
        height: 700.0,
        width: 410.0,
          child: RecipeInstructions(
            addInstructions: (String instructions) => appState.addInstructions(instructions),
          ),
       ),
      ),
    );
  }
}
