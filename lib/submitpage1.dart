import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/recipes.dart';
import 'models/state_model.dart';


///This file represents the first step of the recipe submission process, and works
///in tandem with the recipes.dart file (which holds the layout of the page) and
///the state_model.dart file (which holds the method to submit fields to
///Firebase).  Those two files come together in the body of this class and submit
///the recipe category field to the recipe document in the database.


class FirstSubmitPage extends StatelessWidget {
  const FirstSubmitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade200,

      appBar: AppBar(
        // automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_circle_left_outlined,
            color: Colors.black,
            size: 38.0,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
              height: 400.0,
              width: 410.0,
              child: RecipeCategory(addCategory: (category) => appState.addCategoryToRecipe(category),)
        ),
      ),
    );
  }
}
