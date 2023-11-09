import 'package:bakingapp/models/state_model.dart';
import 'package:flutter/material.dart';
import 'package:bakingapp/models/recipes.dart';
import 'package:provider/provider.dart';

///This file represents the third step of the recipe submission process, and works
///in tandem with the recipes.dart file (which holds the layout of the page) and
///the state_model.dart file (which holds the method to submit fields to
///Firebase).  Those two files come together in the body of this class and submit
///the recipe ingredients, quantities, and unit fields to the recipe document in
///the database.

class ThirdSubmitPage extends StatefulWidget {
  const ThirdSubmitPage({super.key});
  @override
  State<ThirdSubmitPage> createState() => _ThirdSubmitPageState();
}

class _ThirdSubmitPageState extends State<ThirdSubmitPage> {
  // List<String> dropDownItems = ['grams', 'mL', 'tsp', 'tbsp', 'cups', 'whole'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.lightBlue.shade200,

      body: Consumer<ApplicationState>(
          builder: (context, appState, _) => SizedBox(
            height: 700.0,
            width: 410.0,
        child: IngredientNameQuantityUnit(
            addIngredients: (List<String> allIngredients) => appState.addIngredientNames(allIngredients),
            addQuantities: (List<String> allQuantities) => appState.addIngredientQuantity(allQuantities),
            addUnits: (List<String> allUnits) => appState.addIngredientUnits(allUnits),
        ),
      ),
      ),
    );
  }
}
