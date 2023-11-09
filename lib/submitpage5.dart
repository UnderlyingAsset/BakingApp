import 'package:bakingapp/models/recipes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/state_model.dart';

///This file represents the fifth and final step of the recipe submission process,
///and works in tandem with the recipes.dart file (which holds the layout of the
///page) and the state_model.dart file (which holds the method to submit fields to
///Firebase).  Those two files come together in the body of this class and submit
///the recipe notes and image fields to the recipe document in the database.


class FifthSubmitPage extends StatelessWidget {
  const FifthSubmitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.lightBlue.shade200,

      body: Consumer<ApplicationState>(
        builder: (context, appState, _) => SizedBox(
          height: 700.0,
          width: 410.0,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: RecipeNotesAndImage(
              addNotes: (String notes) => appState.addNotes(notes),
              addImage: (String imageURL) => appState.addImage(imageURL),
            ),
          ),
        ),
      ),
    );
  }
}
