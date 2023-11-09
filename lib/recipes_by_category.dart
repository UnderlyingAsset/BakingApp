import 'package:bakingapp/recipes_by_category_cakes_cupcakes.dart';
import 'package:bakingapp/recipes_by_category_confectionery.dart';
import 'package:bakingapp/recipes_by_category_cookies_brownies.dart';
import 'package:bakingapp/recipes_by_category_pies.dart';
import 'package:flutter/material.dart';

///This is a simple page which simple displays the four categories available and
///allows a user to click on one to view recipes contained therein.

class RecipeByCategory extends StatelessWidget {
  const RecipeByCategory({super.key});

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


      body: Container(
        width: 450.0,
        height: 800.0,
        padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Recipe Categories',
                    style: TextStyle(
                      fontSize: 34.0,
                      fontFamily: 'Candy',
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  child: Center(
                    child: Text(
                      'Which category so you want to explore?',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 7.0,
              top: 100.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(65.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return const RecipeByCategoryCookiesBrownies(); }),);
                  },
                  icon: Image.asset('assets/submit-recipe-cookie-brownie.jpg',),
                  iconSize: 155.0,
                ),
              ),
            ),
            Positioned(
              right: 7.0,
              top: 100.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(65.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return const RecipeByCategoryCakesCupcakes(); }),);
                  },
                  icon: Image.asset('assets/submit-recipe-cakes-cupcakes.jpg',),
                  iconSize: 155.0,
                ),

              ),
            ),
            Positioned(
              left: 7.0,
              top: 270.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(65.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return const RecipeByCategoryConfectionery(); }),);
                  },
                  icon: Image.asset('assets/submit-recipe-confectionery.jpg',),
                  iconSize: 155.0,
                ),

              ),
            ),
            Positioned(
              right: 7.0,
              top: 270.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(65.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return const RecipeByCategoryPies(); }),);
                  },
                  icon: Image.asset('assets/submit-recipe-pies.jpg',),
                  iconSize: 155.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
