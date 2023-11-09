import 'package:bakingapp/services/recipe_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'models/full_recipe.dart';

///A class which returns a list of recipes from the "confectionery" category
///within the Recipes collection of the database.  These recipes are shown on
///tiles which can be scrolled through and clicked on to access recipes.

class RecipeByCategoryConfectionery extends StatefulWidget {
  const RecipeByCategoryConfectionery({super.key});

  @override
  State<RecipeByCategoryConfectionery> createState() => _RecipeByCategoryConfectioneryState();
}

class _RecipeByCategoryConfectioneryState extends State<RecipeByCategoryConfectionery> {

  ///This will eventually be a list of documents from the database.
  List<String> docId = [];

  ///Method to collect docId for confectionery recipes.
  Future getDocId() async {
    docId.clear();
    await FirebaseFirestore.instance.collection('recipes')
        .where('category', isEqualTo: 'Confectionery').get()
        .then((snapshot) => snapshot.docs.forEach((document) {
      docId.add(document.reference.id);
    }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlue.shade200,

      appBar: AppBar(
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

      //The list of documents obtained through the database, contained in the
      //list variable docId, is used here in tandem with an index to cycle
      //through the list and display each recipe.

      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Confectionery Recipes',
              style: TextStyle(
                fontSize: 34.0,
                fontFamily: 'Candy',
              ),
            ),
            Expanded(
                child: FutureBuilder(
                    future: getDocId(),
                    builder: (context, snapshot){
                      return ListView.builder(
                          itemCount: docId.length,
                          itemBuilder: (context, index){
                            return ListTile(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return FullRecipeDisplay(recipeId: docId[index]); }),);
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
                                          GetRecipeImageForCard(documentId: docId[index]),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              GetRecipeNameForCard(documentId: docId[index]),
                                              const SizedBox(height: 8.0),
                                              Row(
                                                children: [
                                                  GetNoOfIngredientsForCard(documentId: docId[index]),
                                                ],
                                              ),
                                              const SizedBox(height: 10.0),
                                              Row(
                                                children: [
                                                  GetRecipeCategoryForCard(documentId: docId[index]),
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
