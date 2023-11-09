import 'package:cloud_firestore/cloud_firestore.dart';



///A class containing the recipe model which contains all of the fields
///each recipe will have within the database.


class RecipeModel{
  final String category;
  final String recipeId;
  final String recipeName;
  final int noOfIngredients;
  final List<String> allIngredients;
  final List<double> allQuantities;
  final List<String> allUnits;
  final String instructions;
  final String notes;
  final String imageURL;
  final int timestamp;
  final String userId;
  final String username;


  const RecipeModel({required this.category, required this.recipeName, required this.noOfIngredients,
    required this.allIngredients, required this.allQuantities, required this.allUnits, required this.instructions,
    required this.notes, required this.imageURL, required this.recipeId, required this.timestamp,
    required this.userId, required this.username});


  factory RecipeModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return RecipeModel(
    category: data["category"],
    recipeId: document.id,
    recipeName: data["recipeName"],
    noOfIngredients: data["noOfIngredients"],
    allIngredients: data["allIngredients"],
    allQuantities: data["allQuantities"],
    allUnits: data["allUnits"],
    instructions: data["instructions"],
    notes: data["notes"],
    imageURL: data["imageURL"],
    timestamp: data["timestamp"],
    userId: data["userId"],
    username: data["username"]);
  }
}