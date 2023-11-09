import 'package:bakingapp/recipes_by_category.dart';
import 'package:bakingapp/recipes_new_recipes.dart';
import 'package:bakingapp/recipes_all_recipes.dart';
import 'package:bakingapp/search_results.dart';
import 'package:flutter/material.dart';
import 'package:bakingapp/submitpage1.dart';
import 'package:bakingapp/services/databases.dart';
import 'package:provider/provider.dart';
import 'package:bakingapp/models/user_details.dart';

///This is the landing screen for all signed-in users.  The search function is
///accessible from here, as well as the method to submit recipes and view all
///recipes or recipes by category or most recent.


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController searchTextCont = TextEditingController();
  String searchText = '';

  @override

  Widget build(BuildContext context) {
    return StreamProvider<List<UserDetails>>.value(
      value: DatabaseService(uid: '').usersData,
      initialData: const [],
      child: Scaffold(
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

        ///The beginning of the body property establishes the search feature
        ///shown at the top of the page.
        body: Container(
          width: 450.0,
          height: 800.0,
          padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(),
                      child: SizedBox(
                        width: 350.0,
                        height: 50.0,
                        child: TextField(
                          onChanged: (newText){
                            setState(() {
                              searchText = newText;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: const TextStyle(
                              fontFamily: 'Grenze',
                              fontSize: 18.0,
                            ),
                            prefixIcon: IconButton(
                              icon: const Icon(
                                Icons.search,
                                size: 35,
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return SearchRecipeDisplay(searchTerm: searchText); }),);
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //The four main buttons of the home screen.

              Positioned(
                left: 7.0,
                top: 65.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(65.0),
                  child: IconButton(
                    icon: Image.asset('assets/new-recipes-front-page.jpg'),
                    iconSize: 160.0,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return const NewRecipes(); }),);
                    },
                  ),
                ),
              ),
              Positioned(
                right: 7.0,
                top: 65.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(65.0),
                    child: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return const FirstSubmitPage(); }),);
                    },
                      icon: Image.asset('assets/submit-recipe-front-page.jpg'),
                      iconSize: 160.0,
                    ),
                  ),
              ),
              Positioned(
                left: 7.0,
                top: 250.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(65.0),
                  child: IconButton(
                    icon: Image.asset('assets/all-recipes.jpg'),
                    iconSize: 160.0,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return const RecipesAllRecipes(); }),);
                    },
                  ),
                ),
              ),
              Positioned(
                right: 7.0,
                top: 250.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(65.0),
                  child: IconButton(
                    icon: Image.asset('assets/by-category-front-page.jpg'),
                    iconSize: 160.0,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return const RecipeByCategory(); }),);
                      },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
