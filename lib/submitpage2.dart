import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/recipes.dart';
import 'models/state_model.dart';

///This file represents the second step of the recipe submission process, and works
///in tandem with the recipes.dart file (which holds the layout of the page) and
///the state_model.dart file (which holds the method to submit fields to
///Firebase).  Those two files come together in the body of this class and submit
///the recipe name and number of ingredients fields to the recipe document in
///the database.

class SecondSubmitPage extends StatefulWidget {
  const SecondSubmitPage({super.key});

  @override
  State<SecondSubmitPage> createState() => _SecondSubmitPageState();
}

class _SecondSubmitPageState extends State<SecondSubmitPage> {

  //Variables to hold what a user writes into the name and number fields.
  String recipeName = '';
  String ingredientNumber = '';

  getRecipeName (recipeName){
    this.recipeName = recipeName;
}

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


      body: Consumer<ApplicationState>(
        builder: (context, appState, _) => SizedBox(
            height: 500.0,
            width: 410.0,
            child: RecipeNameAndNoOfIngredients(
              addName: (String recipeName) => appState.addNameToRecipe(recipeName), 
              addNoOfIngredients: (int noOfIngredients) => appState.addNoOfIngredientsToRecipe(noOfIngredients),),
        ),
      ),
    );
  }
}
