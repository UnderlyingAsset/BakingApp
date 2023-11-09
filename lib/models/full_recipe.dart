import 'package:bakingapp/services/recipe_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

///This class represents the page that will display the ingredients
///(including units and quantities), directions, and notes of any
///selected recipe.  This heavily references the recipe_services.dart
///file, which contains all the classes and functions used to display
///information from firebase.  This class also includes the functionality
///of a 'favorite' button, which adds recipes to an array in the user's
///firebase document, and also can remove that same document with a
///double-click (double-click required because state is not currently
///persisted through this class).


class FullRecipeDisplay extends StatefulWidget {
  const FullRecipeDisplay({super.key, required this.recipeId});

  final String recipeId;

  @override
  State<FullRecipeDisplay> createState() => _FullRecipeDisplayState();
}

class _FullRecipeDisplayState extends State<FullRecipeDisplay> with TickerProviderStateMixin {
  bool clicked = false;
  Widget heartIcon = const Icon(Icons.favorite_border_outlined);
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
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


      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: GetRecipeName(documentId: widget.recipeId),
            ),
            const SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GetUserNameForRecipe(documentId: widget.recipeId),
                GetRecipeImage(documentId: widget.recipeId),
                Column(
                  children: [
                    const Text('Add to \n favorites', textAlign: TextAlign.center,),

                //The IconButton below adds the current recipe to the
                //current user's "favorite" array in the user collection
                //on firebase.  Double-clicking will remove the same favorite.
                //A click on the heart icon changes the visible heart icon.
                    IconButton(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                      iconSize: 75.0,
                      onPressed: () {
                        setState(() {
                          clicked = !clicked;
                          if (clicked == true) {
                            heartIcon = const Icon(Icons.favorite);
                            String? currentUser = FirebaseAuth.instance.currentUser?.uid;
                            FirebaseFirestore.instance.collection('users').doc(currentUser)
                                .update({'favorites': FieldValue.arrayUnion([widget.recipeId])});
                          } else{
                            heartIcon = const Icon(Icons.favorite_border_outlined);
                            String? currentUser = FirebaseAuth.instance.currentUser?.uid;
                            FirebaseFirestore.instance.collection('users').doc(currentUser)
                                .update({'favorites': FieldValue.arrayRemove([widget.recipeId])});
                          }
                        });
                      },
                      icon: heartIcon,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey.shade700,
                labelStyle: const TextStyle(fontFamily: 'Grenze', fontSize: 20),
                controller: tabController,
              //The "tabs" property of the TabBar widget define the text that
              //will appear on the top of the screen that can selected
              //between.
                tabs: const [
                  Tab(text: 'Ingredients'),
                  Tab(text: 'Instructions'),
                  Tab(text: 'Notes'),
                ],
              ),
            ),
            Container(
              height: 280.0,
              width: double.maxFinite,
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),

            //The three children of TabBarView correspond to the three
            //tabs in the TabBar widget.  For each container, we call the
            //Class which corresponds to what we want in that container
            //(GetRecipeName, GetRecipeNotes, etc.) and pass it the
            //variable which has been passed to this class, the recipeId.
            //The recipeId represents the unique identifier that each
            //recipe is stored under in Firebase, and allows us to access
            //that full recipe.

              child: TabBarView(
                controller: tabController,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Expanded(
                              child: GetRecipeIngredientsQuantitiesUnits(documentId: widget.recipeId),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 2.0),
                      color: Colors.white,
                      child: GetRecipeInstructions(documentId: widget.recipeId),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 2.0),
                      color: Colors.white,
                      child: GetRecipeNotes(documentId: widget.recipeId),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
