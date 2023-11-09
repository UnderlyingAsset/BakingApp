import 'package:bakingapp/models/full_recipe.dart';
import 'package:bakingapp/services/recipe_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

///This is a class which represents the "favorites" section of the application.
///The querying and code below displays recipe tile cards for all items a
///user has "favorited."  The query returns a list from the "favorites"
///section of the user document for the current user, and displays all
///recipes found on each index.



class Favorites extends StatefulWidget {
  final String? userId;
  const Favorites({super.key, required this.userId});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites>  {

  //List of documents
  List<dynamic> docIdFinal = [];


  //Method to collect all favorites in a user's favorite array list
  //and assign them to the list of documents above.
  Future getFavoritesId() async {
    docIdFinal.clear();
    DocumentReference userFav = FirebaseFirestore.instance.collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid);
    await userFav.get().then((element){
      docIdFinal = element['favorites'];
    });
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

      //The list of documents obtained through the database, contained in the
      //list variable docIdFinal, is used here in tandem with an index to cycle
      //through the list and display each recipe.

      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10.0),
            const Text('Favorites',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 34.0,
                fontFamily: 'Candy',
              ),
            ),
            Expanded(
                child: FutureBuilder(
                    future: getFavoritesId(),
                    builder: (context, snapshot){
                      return ListView.builder(
                          itemCount: docIdFinal.length,
                          itemBuilder: (context, index){
                            return ListTile(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return FullRecipeDisplay(recipeId: docIdFinal[index]); }),);
                              },
                              title: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Card(
                                  color: Colors.grey.shade300,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Stack(
                                        children: [
                                          GetRecipeImageForCard(documentId: docIdFinal[index]),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              GetRecipeNameForCard(documentId: docIdFinal[index]),
                                              const SizedBox(height: 8.0),
                                              Row(
                                                children: [
                                                  GetNoOfIngredientsForCard(documentId: docIdFinal[index]),
                                                ],
                                              ),
                                              const SizedBox(height: 10.0),
                                              Row(
                                                children: [
                                                  GetRecipeCategoryForCard(documentId: docIdFinal[index]),
                                                ],
                                              ),
                                            ]
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    })
            )
          ]
      ),
    );
  }
}