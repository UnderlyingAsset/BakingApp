import 'package:bakingapp/models/user.dart';
import 'package:bakingapp/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bakingapp/firebase_options.dart';


///The class below is used to submit recipes to the Firestore database together
///with the classes in the recipes.dart file.  They are referenced on submitpage1,
///submitpage2, submitpage3, submitpage4, and submitpage5 under the
///Consumer<ApplicationState> widget, within the body of the Scaffold widget.  All
///fields of a recipe are created upon choosing a category (submitpage1), and are
///then updated with each subsequent page being accessed and filled out.


class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }
  var myDoc = FirebaseFirestore.instance.collection('recipes').doc();
  final bool _loggedIn = true;
  bool get loggedIn => _loggedIn;

  Future<void> init() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  Future<void> addCategoryToRecipe(String category) {

    return myDoc.set({
      'category': category,
      'username': FirebaseAuth.instance.currentUser!.displayName,
      'userId': FirebaseAuth.instance.currentUser!.uid,
      'recipeId': myDoc.id,
      'recipeName': '',
      'noOfIngredients': 2,
      'allIngredients': [],
      'ingredientQuantities': [],
      'ingredientUnits': [],
      'instructions': '',
      'notes': '',
      'image': '',
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });
  }

  Future<void> addNameToRecipe(String recipeName) {

    return myDoc.update({
      'recipeName': recipeName,
    });
  }

  Future<void> addNoOfIngredientsToRecipe(int noOfIngredients) {

    return myDoc.update({
      'noOfIngredients': noOfIngredients,
    });
  }

  Future<void> addIngredientNames(List<String> allIngredients) {

    return myDoc.update({
       'allIngredients': allIngredients,
    });
  }

  Future<void> addIngredientQuantity(List<String> allQuantities) {

    return myDoc.update({
      'ingredientQuantities': allQuantities,
    });
  }

  Future<void> addIngredientUnits(List<String> allUnits) {

    return myDoc.update({
      'ingredientUnits': allUnits,
    });
  }

  Future<void> addInstructions(String instructions) {

    return myDoc.update({
      'instructions': instructions,
    });
  }

  Future<void> addNotes(String notes) {

    return myDoc.update({
      'notes': notes,
    });
  }

  Future<void> addImage(String imageURL) {

    return myDoc.update({
      'image': imageURL,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });
  }
}

class StateModel {
  Loading isLoading = const Loading();
  NewUser user;
  List<String> favorites;

  StateModel({
    required this.isLoading,
    required this.user,
    required this.favorites,
  });
}