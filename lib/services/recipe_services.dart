import 'package:bakingapp/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


///This first 4 classes here are formatted to display recipe data on a list  of
///individual cards (tiles) when the recipes are on a larger list (for example,
///when querying for New Recipes or All Recipes)rather than being in full
///recipe view with all details.

class GetRecipeNameForCard extends StatelessWidget {
  final String documentId;
  const GetRecipeNameForCard({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference recipes = FirebaseFirestore.instance.collection('recipes');
    return FutureBuilder<DocumentSnapshot>(
        future: recipes.doc(documentId).get(),
        builder: ((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done){
        Map<String, dynamic> newData =
        snapshot.data!.data() as Map<String, dynamic>;
        return SizedBox(
          width: 190,
          child: Text('${newData['recipeName']}',
              maxLines: 1,
              overflow: TextOverflow.clip,
              softWrap: false,
              style: const TextStyle(fontFamily: 'Candy', fontSize: 20.0),),
        );
      }
      return const Text('Loading...');
    }));
  }
}


///A class to return the number of ingredients for each card (tile)
///seen on the listview (AllRecipes, NewRecipes, etc.).

class GetNoOfIngredientsForCard extends StatelessWidget {
  final String documentId;
  const GetNoOfIngredientsForCard({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference recipes = FirebaseFirestore.instance.collection('recipes');
    return FutureBuilder<DocumentSnapshot>(
        future: recipes.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> newData =
            snapshot.data!.data() as Map<String, dynamic>;
            return Text('${newData['noOfIngredients']} ingredients',
            style: const TextStyle(fontFamily: 'Grenze', fontSize: 17.0),);
          }
          return const Text('Loading...');
        }));
  }
}

///A class to return the recipe category for each card (tile)
///seen on the listview (AllRecipes, NewRecipes, etc.).

class GetRecipeCategoryForCard extends StatelessWidget {
  final String documentId;
  const GetRecipeCategoryForCard({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference recipes = FirebaseFirestore.instance.collection('recipes');
    return FutureBuilder<DocumentSnapshot>(
        future: recipes.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> newData =
            snapshot.data!.data() as Map<String, dynamic>;
            return Text('Category: ${newData['category']}',
            style: const TextStyle(fontFamily: 'Grenze', fontSize: 18.0),);
          }
          return const Text('Loading...');
        }));
  }
}

///A class to return the recipe image for each card (tile)
///seen on the listview (AllRecipes, NewRecipes, etc.).

class GetRecipeImageForCard extends StatelessWidget {
  final String documentId;
  const GetRecipeImageForCard({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference recipes = FirebaseFirestore.instance.collection('recipes');
    return FutureBuilder<DocumentSnapshot>(
        future: recipes.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> newData =
            snapshot.data!.data() as Map<String, dynamic>;
            return Image.network(
                '${newData['image']}',
                width: 120.0,
                height: 120.0,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                  return Image.asset(
                      'assets/no-image-found.png',
                      width: 120.0,
                      height: 120.0);
                },
            );
          }
          return const Loading();
        }));
  }
}


///The classes from here represent how the components of each recipe are
///displayed in the full recipe view property.  These include the recipe
///name, the recipe image, the instructions, ingredients (with quantities
///and units), and notes.  They are predominantly implemented in the
///full_recipe.dart file.  The names are relatively self-explanatory in terms
///of the function of each class.


///A class to return the recipe name in the full recipe
///view (full_recipe.dart).

class GetRecipeName extends StatelessWidget {
  final String documentId;
  const GetRecipeName({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference recipes = FirebaseFirestore.instance.collection('recipes');
    return FutureBuilder<DocumentSnapshot>(
        future: recipes.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> newData =
            snapshot.data!.data() as Map<String, dynamic>;
            return Text('${newData['recipeName']}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 34.0,
                fontFamily: 'Candy',
              ),);
          }
          return const Text('Loading...');
        }));
  }
}

///A class to return the username for the user who submitted the recipe
///in the full recipe view (full_recipe.dart).

class GetUserNameForRecipe extends StatelessWidget {
  final String documentId;
  const GetUserNameForRecipe({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference recipes = FirebaseFirestore.instance.collection('recipes');
    return FutureBuilder<DocumentSnapshot>(
        future: recipes.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> newData =
            snapshot.data!.data() as Map<String, dynamic>;
            return Column(
              children: [
                const Text('Submitted by',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Candy',
                  ),
                ),
                Text('${newData['username']}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Grenze',
                  ),
                ),
              ],
            );
          }
          return const Text('Loading...');
        }));
  }
}

///A class to return the recipe image in the full recipe
///view (full_recipe.dart).

class GetRecipeImage extends StatelessWidget {
  final String documentId;
  const GetRecipeImage({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference recipes = FirebaseFirestore.instance.collection('recipes');
    return FutureBuilder<DocumentSnapshot>(
        future: recipes.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> newData =
            snapshot.data!.data() as Map<String, dynamic>;
            return CircleAvatar(
              radius: 60.0,
              foregroundImage: NetworkImage(
                '${newData['image']}',
              ),
              backgroundImage: const AssetImage('assets/no-image-found.png'),
            );
          }
          return const Text('Loading...');
        }));
  }
}


///This is the class that returns the ingredients, their quantities, and
///the units necessary for each one in one large list view, found in
///full_recipe.dart.



class GetRecipeIngredientsQuantitiesUnits extends StatelessWidget {
  final String documentId;
  const GetRecipeIngredientsQuantitiesUnits({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference recipes = FirebaseFirestore.instance.collection('recipes');
    return FutureBuilder<DocumentSnapshot>(
        future: recipes.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> newData =
            snapshot.data!.data() as Map<String, dynamic>;
            final allIngredients = newData['allIngredients'] as List;
            allIngredients.removeWhere((item) => item.isEmpty);
            final allQuantities = newData['ingredientQuantities'] as List;
            allQuantities.removeWhere((item) => item == '');
            final allUnits = newData['ingredientUnits'] as List;
            allUnits.removeWhere((item) => item.isEmpty);
            return ListView.separated(
                separatorBuilder: (BuildContext context, int index){
                  return Divider(color: Colors.green.shade800, height: 17.0, thickness: 1.5);
                },
                itemCount: allIngredients.length,
                itemBuilder: (context, index){
                  return Row(
                    children: [
                      Text(allIngredients[index],
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'Grenze',
                        ),),
                      const Spacer(flex: 49),
                      Text(allQuantities[index],
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'Grenze',
                        ),),
                      const Spacer(flex: 1),
                      Text(allUnits[index],
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'Grenze',
                        ),),
                    ],
                  );
                }
            );
          }
          return const Text('Loading...');
        }));
  }
}


///A class to return the recipe instructions in the full recipe
///view (full_recipe.dart).

class GetRecipeInstructions extends StatelessWidget {
  final String documentId;
  const GetRecipeInstructions({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference recipes = FirebaseFirestore.instance.collection('recipes');
    return SingleChildScrollView(
      child: FutureBuilder<DocumentSnapshot>(
          future: recipes.doc(documentId).get(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done){
              Map<String, dynamic> newData =
              snapshot.data!.data() as Map<String, dynamic>;
              return Text('${newData['instructions']}',
                style: const TextStyle(
                  fontSize: 22.0,
                  fontFamily: 'Grenze',
                ),);
            }
            return const Text('Loading...');
          })),
    );
  }
}

///A class to return the recipe notes in the full recipe
///view (full_recipe.dart).

class GetRecipeNotes extends StatelessWidget {
  final String documentId;
  const GetRecipeNotes({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference recipes = FirebaseFirestore.instance.collection('recipes');
    return SingleChildScrollView(
      child: FutureBuilder<DocumentSnapshot>(
          future: recipes.doc(documentId).get(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done){
              Map<String, dynamic> newData =
              snapshot.data!.data() as Map<String, dynamic>;
              return Text('${newData['notes']}',
                style: const TextStyle(
                  fontSize: 22.0,
                  fontFamily: 'Grenze',
                ),);
            }
            return const Text('Loading...');
          })),
    );
  }
}
