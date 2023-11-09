import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../submitpage2.dart';
import '../submitpage3.dart';
import '../submitpage4.dart';
import '../submitpage5.dart';
import '../submitpage6.dart';


///Within this file are classes used to create recipe object for various fields
/// within each recipe.  This file represents 5 different screens on the
///application, submitpage1, submitpage2, submitpage3, submitpage4, and
///submitpage5.  Those files call to this file to pass data on to firebase.
///Each class is separated by a generous amount of blank space in the editor,
///so to easily find the next class, simple scroll until a large blank space
///is seen.




///A class to get a recipe category from a user. This class is called in the
///body of submitpage1.  In this case, when a user clicks any of the 4 buttons
///(representing categories) on the screen, that button creates a new document
///in the database and stores the category therein.

class RecipeCategory extends StatefulWidget {
  const RecipeCategory({required this.addCategory, super.key});

  final FutureOr<void> Function(String category) addCategory;

  @override
  State<RecipeCategory> createState() => _RecipeCategoryState();
}


class _RecipeCategoryState extends State<RecipeCategory> {
  final myDoc = FirebaseFirestore.instance.collection('recipes').doc();
  final _formKey = GlobalKey<FormState>(debugLabel: '_RecipeCategoryState');
  final String category1 = 'Cookies/Brownies';
  final String category2 = 'Cakes/Cupcakes';
  final String category3 = 'Confectionery';
  final String category4 = 'Pies';
  String category = '';

  setCategory (String category){
    this.category = category;
  }

  getCategory () {
    return category;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lightBlue.shade200,
      child: Container(
        width: 450.0,
        height: 800.0,
        padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
        child: Form(
          key: _formKey,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Submit Recipe',
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
                        'Which category does your recipe best fit into?',
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        category = 'Cookies/Brownies';
                        await widget.addCategory(category);
                      }
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return const SecondSubmitPage(); }),);
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          setCategory('Cakes/Cupcakes');
                        });
                        await widget.addCategory(category);
                      }
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return const SecondSubmitPage(); }),);
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          setCategory('Confectionery');
                        });
                        await widget.addCategory(category);
                      }
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return const SecondSubmitPage(); }),);
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          setCategory('Pies');
                        });
                        await widget.addCategory(category);
                      }
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return const SecondSubmitPage(); }),);
                    },
                    icon: Image.asset('assets/submit-recipe-pies.jpg',),
                    iconSize: 155.0,
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
























///A class which takes both the recipe name and the number of ingredients from
///the user, and submits them to the database (already established by the
///RecipeCategory class) when the "Next" button is pressed at the bottom of the
///page.  There are some error checks present in this class, and users must submit
///both a name and a number (2 or higher, 15 or lower) before they can click Next,
///or they are faced with an error message.  This class is called in the body of
/// submitpage2.


class RecipeNameAndNoOfIngredients extends StatefulWidget {
  const RecipeNameAndNoOfIngredients({required this.addName, required this.addNoOfIngredients, super.key});
  final FutureOr<void> Function(String recipeName) addName;
  final FutureOr<void> Function(int noOfIngredients) addNoOfIngredients;

  @override
  State<RecipeNameAndNoOfIngredients> createState() => _RecipeNameAndNoOfIngredientsState();
}

class _RecipeNameAndNoOfIngredientsState extends State<RecipeNameAndNoOfIngredients> {
  ///Variables to hold what a user writes into the name and number fields.
  final _formKey = GlobalKey<FormState>(debugLabel: '_RecipeNameAndNoOfIngredients');
  String recipeName = '';
  int noOfIngredients = 0;

  setRecipeName (recipeName){
    this.recipeName = recipeName;
  }
  setNoOfIngredients (noOfIngredients){
    this.noOfIngredients = noOfIngredients;
  }
  getRecipeName (){
    return recipeName;
  }
  getNoOfIngredients (){
    return noOfIngredients;
  }



  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lightBlue.shade200,
      child: Container(
        width: 450.0,
        height: 800.0,
        padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Submit Recipe',
                  style: TextStyle(
                    fontSize: 34.0,
                    fontFamily: 'Candy',
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
                child: Center(
                  child: Text(
                    'What is the name of your recipe?',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Grenze',
                    ),
                  ),
                ),
              ),
              const Spacer(flex:1,),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  width: 370.0,
                  height: 60.0,
                  color: Colors.white,
                  child: TextFormField(
                    maxLength: 40,
                    validator: (val){
                      if (val == null || val.isEmpty){
                        return '   Please enter a recipe name';
                      }
                      return null;
                    },
                    onChanged: (val){
                      setState(() => setRecipeName(val));
                    },
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Grenze',
                    ),
                    decoration: const InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      hintText: 'Recipe name...',
                    ),
                  ),
                ),
              ),
              const Spacer(flex:5,),
              const SizedBox(
                child: Center(
                  child: Text(
                    'How many ingredients are in your recipe?',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Grenze',
                    ),
                  ),
                ),
              ),
              const Spacer(flex:1,),
              const SizedBox(
                child: Center(
                  child: Text(
                    '(Minimum 2, Maximum 15)',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Grenze',
                    ),
                  ),
                ),
              ),
              const Spacer(flex:2,),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 70.0,
                  height: 60.0,
                  color: Colors.white,
                  child: Center(
                    child: TextFormField(
                      maxLength: 2,
                      validator: (val){
                        if (val == null || val.isEmpty || int.parse(val) > 15 || int.parse(val) < 2){
                          return '    Invalid #';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        setState(() => setNoOfIngredients(int.parse(val)));
                      },
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Grenze',
                      ),
                      decoration: const InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                        hintText: '#',
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(flex:2,),
              SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {Navigator.pop(context);},
                        icon: Image.asset('assets/back-button-cookie.png',),
                        iconSize: 120.0,
                        style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0),),),),
                      ),
                      IconButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await widget.addName(recipeName);
                            widget.addNoOfIngredients(noOfIngredients);
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return const ThirdSubmitPage(); }),);
                          }
                          else{
                            print('Error!');
                          }
                        },
                        icon: Image.asset('assets/next-button-cake.png',),
                        iconSize: 120.0,
                        style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0),),),),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}





















///A class used to take the ingredient names as well as the quantity and the units
///of each one and submit them to the document already created in our database
///via the RecipeCategory class above when the "Next" button is pressed at the
///bottom of the page.  The code for this class is incredibly long, mainly due
///to a lot of repeated code containing unique variables which was difficult to
///make modular.  There are also a series of error checks: Ingredient 1 and 2
///must be fully filled out (as well as quantities and units), no number can be
///negative, and both ingredients names and quantities have text input limits
///(35 and 5 respectively).  This class is called in the body of submitpage2.


class IngredientNameQuantityUnit extends StatefulWidget {
  const IngredientNameQuantityUnit({required this.addIngredients, required this.addQuantities, required this.addUnits, super.key});
  final FutureOr<void> Function(List<String> allIngredients) addIngredients;
  final FutureOr<void> Function(List<String> allQuantities) addQuantities;
  final FutureOr<void> Function(List<String> allUnits) addUnits;

  @override
  State<IngredientNameQuantityUnit> createState() => _IngredientNameQuantityUnitState();
}

class _IngredientNameQuantityUnitState extends State<IngredientNameQuantityUnit> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_IngredientNameQuantityUnitState');
  //Variables to hold the fields typed into the ingredient name form fields.

  List<String> allIngredientNames = [];
  TextEditingController ing1 = TextEditingController();
  String ingredient1 = '';
  TextEditingController ing2 = TextEditingController();
  String ingredient2 = '';
  TextEditingController ing3 = TextEditingController();
  String ingredient3 = '';
  TextEditingController ing4 = TextEditingController();
  String ingredient4 = '';
  TextEditingController ing5 = TextEditingController();
  String ingredient5 = '';
  TextEditingController ing6 = TextEditingController();
  String ingredient6 = '';
  TextEditingController ing7 = TextEditingController();
  String ingredient7 = '';
  TextEditingController ing8 = TextEditingController();
  String ingredient8 = '';
  TextEditingController ing9 = TextEditingController();
  String ingredient9 = '';
  TextEditingController ing10 = TextEditingController();
  String ingredient10 = '';
  TextEditingController ing11 = TextEditingController();
  String ingredient11 = '';
  TextEditingController ing12 = TextEditingController();
  String ingredient12 = '';
  TextEditingController ing13 = TextEditingController();
  String ingredient13 = '';
  TextEditingController ing14 = TextEditingController();
  String ingredient14 = '';
  TextEditingController ing15 = TextEditingController();
  String ingredient15 = '';

//Variables to hold the fields typed into the quantity form fields.
  List<String> allQuantities = [];
  TextEditingController quan1 = TextEditingController();
  String quantity1 = '';
  TextEditingController quan2 = TextEditingController();
  String quantity2 = '';
  TextEditingController quan3 = TextEditingController();
  String quantity3 = '';
  TextEditingController quan4 = TextEditingController();
  String quantity4 = '';
  TextEditingController quan5 = TextEditingController();
  String quantity5 = '';
  TextEditingController quan6 = TextEditingController();
  String quantity6 = '';
  TextEditingController quan7 = TextEditingController();
  String quantity7 = '';
  TextEditingController quan8 = TextEditingController();
  String quantity8 = '';
  TextEditingController quan9 = TextEditingController();
  String quantity9 = '';
  TextEditingController quan10 = TextEditingController();
  String quantity10 = '';
  TextEditingController quan11 = TextEditingController();
  String quantity11 = '';
  TextEditingController quan12 = TextEditingController();
  String quantity12 = '';
  TextEditingController quan13 = TextEditingController();
  String quantity13 = '';
  TextEditingController quan14 = TextEditingController();
  String quantity14 = '';
  TextEditingController quan15 = TextEditingController();
  String quantity15 = '';


  List<String> itemSelector = ['', 'grams', 'mL', 'tsp', 'tbsp', 'cups', 'ounces', 'whole'];
  List<String> allUnits = [];
  String currentlySelected1 = '';
  String currentlySelected2 = '';
  String currentlySelected3 = '';
  String currentlySelected4 = '';
  String currentlySelected5 = '';
  String currentlySelected6 = '';
  String currentlySelected7 = '';
  String currentlySelected8 = '';
  String currentlySelected9 = '';
  String currentlySelected10 = '';
  String currentlySelected11 = '';
  String currentlySelected12 = '';
  String currentlySelected13 = '';
  String currentlySelected14 = '';
  String currentlySelected15 = '';

  get getIngredients{
    return allIngredientNames;
  }
  get getUnits{
    return allUnits;
  }
  get getQuantity{
    return allQuantities;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lightBlue.shade200,
      child: SingleChildScrollView(
          child: Container(
            // width: 450.0,
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
            child: Form(
              key:  _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //Header of the page.

                  const Center(
                    child: Text(
                      'Submit Recipe',
                      style: TextStyle(
                        fontSize: 34.0,
                        fontFamily: 'Candy',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                    child: Center(
                      child: Text(
                        'Please list all ingredients, along with',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Grenze',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                    child: Center(
                      child: Text(
                        'appropriate measurements.',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Grenze',
                        ),
                      ),
                    ),
                  ),


                  //Begin of the main body of the page

                  const SizedBox(
                    height: 30.0,
                    child: Text(
                      'Ingredient #1',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 380.0,
                    height: 60.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          width: 200.0,
                          height: 50.0,
                          color: Colors.white,
                          child: TextFormField(
                            validator: (val){
                              if (val == null || val.isEmpty){
                                return '   Please enter an ingredient name';
                              }
                              return null;
                            },
                            maxLength: 35,
                            controller: ing1,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Grenze',
                            ),
                            decoration: const InputDecoration(
                              counterText: '',
                              border: InputBorder.none,
                              hintText: 'Ingredient name...',
                            ),
                            onChanged: (ing1){
                              setState(() {
                                ingredient1 = ing1;
                              });
                            },
                          ),
                        ),
                      ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 60.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                                validator: (val){
                                  if (val == null || val.isEmpty || val == '0' || val.startsWith('-')){
                                    return '  Invalid #';
                                  }
                                  return null;
                                },
                                maxLength: 5,
                              controller: quan1,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                fontSize: 26.0,
                                fontFamily: 'Grenze',
                              ),
                              decoration: const InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                                hintText: '#',
                              ),
                              onChanged: (quan1){
                                setState(() {
                                  quantity1 = quan1;
                                });
                              }
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 90.0,
                            height: 49.0,
                            color: Colors.white,
                            child: DropdownButton<String>(
                              value: currentlySelected1,
                              isExpanded: true,
                              items: itemSelector
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  currentlySelected1 = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                    child: Text(
                      'Ingredient #2',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 380.0,
                    height: 60.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      width: 200.0,
                      height: 50.0,
                      color: Colors.white,
                      child: TextFormField(
                        validator: (val){
                          if (val == null || val.isEmpty){
                            return '   Please enter an ingredient name';
                          }
                          return null;
                        },
                        maxLength: 35,
                        controller: ing2,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Grenze',
                        ),
                        decoration: const InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          hintText: 'Ingredient name...',
                        ),
                        onChanged: (ing2){
                          setState(() {
                            ingredient2 = ing2;
                          });
                        },
                      ),
                    ),
                  ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 60.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                                validator: (val){
                                  if (val == null || val.isEmpty || val == '0' || val.startsWith('-')){
                                    return '  Invalid #';
                                  }
                                  return null;
                                },
                                maxLength: 5,
                                controller: quan2,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  fontSize: 26.0,
                                  fontFamily: 'Grenze',
                                ),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  hintText: '#',
                                ),
                                onChanged: (quan2){
                                  setState(() {
                                    quantity2 = quan2;
                                  });
                                }
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 90.0,
                            height: 49.0,
                            color: Colors.white,
                            child: DropdownButton<String>(
                              value: currentlySelected2,
                              isExpanded: true,
                              items: itemSelector
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  currentlySelected2 = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                    child: Text(
                      'Ingredient #3',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 380.0,
                    height: 60.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      width: 200.0,
                      height: 50.0,
                      color: Colors.white,
                      child: TextFormField(
                        maxLength: 35,
                        controller: ing3,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Grenze',
                        ),
                        decoration: const InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          hintText: 'Ingredient name...',
                        ),
                        onChanged: (ing3){
                          setState(() {
                            ingredient3 = ing3;
                          });
                        },
                      ),
                    ),
                  ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 60.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                                validator: (val){
                                  if (val == '0' || val!.startsWith('-')){
                                    return '  Invalid #';
                                  }
                                  return null;
                                },
                                maxLength: 5,
                                controller: quan3,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  fontSize: 26.0,
                                  fontFamily: 'Grenze',
                                ),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  hintText: '#',
                                ),
                                onChanged: (quan3){
                                  setState(() {
                                    quantity3 = quan3;
                                  });
                                }
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 90.0,
                            height: 49.0,
                            color: Colors.white,
                            child: DropdownButton<String>(
                              value: currentlySelected3,
                              isExpanded: true,
                              items: itemSelector
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  currentlySelected3 = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                    child: Text(
                      'Ingredient #4',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 380.0,
                    height: 60.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 200.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                              maxLength: 35,
                              controller: ing4,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Grenze',
                              ),
                              decoration: const InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                                hintText: 'Ingredient name...',
                              ),
                              onChanged: (ing4){
                                setState(() {
                                  ingredient4 = ing4;
                                });
                              },
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 60.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                                validator: (val){
                                  if (val == '0' || val!.startsWith('-')){
                                    return '  Invalid #';
                                  }
                                  return null;
                                },
                                maxLength: 5,
                                controller: quan4,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  fontSize: 26.0,
                                  fontFamily: 'Grenze',
                                ),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  hintText: '#',
                                ),
                                onChanged: (quan4){
                                  setState(() {
                                    quantity4 = quan4;
                                  });
                                }
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 90.0,
                            height: 49.0,
                            color: Colors.white,
                            child: DropdownButton<String>(
                              value: currentlySelected4,
                              isExpanded: true,
                              items: itemSelector
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  currentlySelected4 = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                    child: Text(
                      'Ingredient #5',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 380.0,
                    height: 60.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 200.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                              maxLength: 35,
                              controller: ing5,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Grenze',
                              ),
                              decoration: const InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                                hintText: 'Ingredient name...',
                              ),
                              onChanged: (ing5){
                                setState(() {
                                  ingredient5 = ing5;
                                });
                              },
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 60.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                                validator: (val){
                                  if (val == '0' || val!.startsWith('-')){
                                    return '  Invalid #';
                                  }
                                  return null;
                                },
                                maxLength: 5,
                                controller: quan5,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  fontSize: 26.0,
                                  fontFamily: 'Grenze',
                                ),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  hintText: '#',
                                ),
                                onChanged: (quan5){
                                  setState(() {
                                    quantity5 = quan5;
                                  });
                                }
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 90.0,
                            height: 49.0,
                            color: Colors.white,
                            child: DropdownButton<String>(
                              value: currentlySelected5,
                              isExpanded: true,
                              items: itemSelector
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  currentlySelected5 = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                    child: Text(
                      'Ingredient #6',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 380.0,
                    height: 60.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 200.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                              maxLength: 35,
                              controller: ing6,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Grenze',
                              ),
                              decoration: const InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                                hintText: 'Ingredient name...',
                              ),
                              onChanged: (ing6){
                                setState(() {
                                  ingredient6 = ing6;
                                });
                              },
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 60.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                                validator: (val){
                                  if (val == '0' || val!.startsWith('-')){
                                    return '  Invalid #';
                                  }
                                  return null;
                                },
                                maxLength: 5,
                                controller: quan6,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  fontSize: 26.0,
                                  fontFamily: 'Grenze',
                                ),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  hintText: '#',
                                ),
                                onChanged: (quan6){
                                  setState(() {
                                    quantity6 = quan6;
                                  });
                                }
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 90.0,
                            height: 49.0,
                            color: Colors.white,
                            child: DropdownButton<String>(
                              value: currentlySelected6,
                              isExpanded: true,
                              items: itemSelector
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  currentlySelected6 = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                    child: Text(
                      'Ingredient #7',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 380.0,
                    height: 60.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 200.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                              maxLength: 35,
                              controller: ing7,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Grenze',
                              ),
                              decoration: const InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                                hintText: 'Ingredient name...',
                              ),
                              onChanged: (ing7){
                                setState(() {
                                  ingredient7 = ing7;
                                });
                              },
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 60.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                                validator: (val){
                                  if (val == '0' || val!.startsWith('-')){
                                    return '  Invalid #';
                                  }
                                  return null;
                                },
                                maxLength: 5,
                                controller: quan7,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  fontSize: 26.0,
                                  fontFamily: 'Grenze',
                                ),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  hintText: '#',
                                ),
                                onChanged: (quan7){
                                  setState(() {
                                    quantity7 = quan7;
                                  });
                                }
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 90.0,
                            height: 49.0,
                            color: Colors.white,
                            child: DropdownButton<String>(
                              value: currentlySelected7,
                              isExpanded: true,
                              items: itemSelector
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  currentlySelected7 = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                    child: Text(
                      'Ingredient #8',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 380.0,
                    height: 60.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 200.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                              maxLength: 35,
                              controller: ing8,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Grenze',
                              ),
                              decoration: const InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                                hintText: 'Ingredient name...',
                              ),
                              onChanged: (ing8){
                                setState(() {
                                  ingredient8 = ing8;
                                });
                              },
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 60.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                                validator: (val){
                                  if (val == '0' || val!.startsWith('-')){
                                    return '  Invalid #';
                                  }
                                  return null;
                                },
                                maxLength: 5,
                                controller: quan8,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  fontSize: 26.0,
                                  fontFamily: 'Grenze',
                                ),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  hintText: '#',
                                ),
                                onChanged: (quan8){
                                  setState(() {
                                    quantity8 = quan8;
                                  });
                                }
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 90.0,
                            height: 49.0,
                            color: Colors.white,
                            child: DropdownButton<String>(
                              value: currentlySelected8,
                              isExpanded: true,
                              items: itemSelector
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  currentlySelected8 = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                    child: Text(
                      'Ingredient #9',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 380.0,
                    height: 60.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 200.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                              maxLength: 35,
                              controller: ing9,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Grenze',
                              ),
                              decoration: const InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                                hintText: 'Ingredient name...',
                              ),
                              onChanged: (ing9){
                                setState(() {
                                  ingredient9 = ing9;
                                });
                              },
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 60.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                                validator: (val){
                                  if (val == '0' || val!.startsWith('-')){
                                    return '  Invalid #';
                                  }
                                  return null;
                                },
                                maxLength: 5,
                                controller: quan9,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  fontSize: 26.0,
                                  fontFamily: 'Grenze',
                                ),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  hintText: '#',
                                ),
                                onChanged: (quan9){
                                  setState(() {
                                    quantity9 = quan9;
                                  });
                                }
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 90.0,
                            height: 49.0,
                            color: Colors.white,
                            child: DropdownButton<String>(
                              value: currentlySelected9,
                              isExpanded: true,
                              items: itemSelector
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  currentlySelected9 = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                    child: Text(
                      'Ingredient #10',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 380.0,
                    height: 60.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 200.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                              maxLength: 35,
                              controller: ing10,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Grenze',
                              ),
                              decoration: const InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                                hintText: 'Ingredient name...',
                              ),
                              onChanged: (ing10){
                                setState(() {
                                  ingredient10 = ing10;
                                });
                              },
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 60.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                                validator: (val){
                                  if (val == '0' || val!.startsWith('-')){
                                    return '  Invalid #';
                                  }
                                  return null;
                                },
                                maxLength: 5,
                                controller: quan10,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  fontSize: 26.0,
                                  fontFamily: 'Grenze',
                                ),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  hintText: '#',
                                ),
                                onChanged: (quan10){
                                  setState(() {
                                    quantity10 = quan10;
                                  });
                                }
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 90.0,
                            height: 49.0,
                            color: Colors.white,
                            child: DropdownButton<String>(
                              value: currentlySelected10,
                              isExpanded: true,
                              items: itemSelector
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  currentlySelected10 = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                    child: Text(
                      'Ingredient #11',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 380.0,
                    height: 60.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 200.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                              maxLength: 35,
                              controller: ing11,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Grenze',
                              ),
                              decoration: const InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                                hintText: 'Ingredient name...',
                              ),
                              onChanged: (ing11){
                                setState(() {
                                  ingredient11 = ing11;
                                });
                              },
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 60.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                                validator: (val){
                                  if (val == '0' || val!.startsWith('-')){
                                    return '  Invalid #';
                                  }
                                  return null;
                                },
                                maxLength: 5,
                                controller: quan11,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  fontSize: 26.0,
                                  fontFamily: 'Grenze',
                                ),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  hintText: '#',
                                ),
                                onChanged: (quan11){
                                  setState(() {
                                    quantity11 = quan11;
                                  });
                                }
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 90.0,
                            height: 49.0,
                            color: Colors.white,
                            child: DropdownButton<String>(
                              value: currentlySelected11,
                              isExpanded: true,
                              items: itemSelector
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  currentlySelected11 = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                    child: Text(
                      'Ingredient #12',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 380.0,
                    height: 60.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 200.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                              maxLength: 35,
                              controller: ing12,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Grenze',
                              ),
                              decoration: const InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                                hintText: 'Ingredient name...',
                              ),
                              onChanged: (ing12){
                                setState(() {
                                  ingredient12 = ing12;
                                });
                              },
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 60.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                                validator: (val){
                                  if (val == '0' || val!.startsWith('-')){
                                    return '  Invalid #';
                                  }
                                  return null;
                                },
                                maxLength: 5,
                                controller: quan12,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  fontSize: 26.0,
                                  fontFamily: 'Grenze',
                                ),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  hintText: '#',
                                ),
                                onChanged: (quan12){
                                  setState(() {
                                    quantity12 = quan12;
                                  });
                                }
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 90.0,
                            height: 49.0,
                            color: Colors.white,
                            child: DropdownButton<String>(
                              value: currentlySelected12,
                              isExpanded: true,
                              items: itemSelector
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  currentlySelected12 = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                    child: Text(
                      'Ingredient #13',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 380.0,
                    height: 60.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 200.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                              maxLength: 35,
                              controller: ing13,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Grenze',
                              ),
                              decoration: const InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                                hintText: 'Ingredient name...',
                              ),
                              onChanged: (ing13){
                                setState(() {
                                  ingredient13 = ing13;
                                });
                              },
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 60.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                                validator: (val){
                                  if (val == '0' || val!.startsWith('-')){
                                    return '  Invalid #';
                                  }
                                  return null;
                                },
                                maxLength: 5,
                                controller: quan13,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  fontSize: 26.0,
                                  fontFamily: 'Grenze',
                                ),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  hintText: '#',
                                ),
                                onChanged: (quan13){
                                  setState(() {
                                    quantity13 = quan13;
                                  });
                                }
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 90.0,
                            height: 49.0,
                            color: Colors.white,
                            child: DropdownButton<String>(
                              value: currentlySelected13,
                              isExpanded: true,
                              items: itemSelector
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  currentlySelected13 = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                    child: Text(
                      'Ingredient #14',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 380.0,
                    height: 60.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 200.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                              maxLength: 35,
                              controller: ing14,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Grenze',
                              ),
                              decoration: const InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                                hintText: 'Ingredient name...',
                              ),
                              onChanged: (ing14){
                                setState(() {
                                  ingredient14 = ing14;
                                });
                              },
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 60.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                                validator: (val){
                                  if (val == '0' || val!.startsWith('-')){
                                    return '  Invalid #';
                                  }
                                  return null;
                                },
                                maxLength: 5,
                                controller: quan14,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  fontSize: 26.0,
                                  fontFamily: 'Grenze',
                                ),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  hintText: '#',
                                ),
                                onChanged: (quan14){
                                  setState(() {
                                    quantity14 = quan14;
                                  });
                                }
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 90.0,
                            height: 49.0,
                            color: Colors.white,
                            child: DropdownButton<String>(
                              value: currentlySelected14,
                              isExpanded: true,
                              items: itemSelector
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  currentlySelected14 = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                    child: Text(
                      'Ingredient #15',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 380.0,
                    height: 60.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 200.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                              maxLength: 35,
                              controller: ing15,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Grenze',
                              ),
                              decoration: const InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                                hintText: 'Ingredient name...',
                              ),
                              onChanged: (ing15){
                                setState(() {
                                  ingredient15 = ing15;
                                });
                              },
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 60.0,
                            height: 50.0,
                            color: Colors.white,
                            child: TextFormField(
                                validator: (val){
                                  if (val == '0' || val!.startsWith('-')){
                                    return '  Invalid #';
                                  }
                                  return null;
                                },
                                maxLength: 5,
                                controller: quan15,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  fontSize: 26.0,
                                  fontFamily: 'Grenze',
                                ),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  hintText: '#',
                                ),
                                onChanged: (quan15){
                                  setState(() {
                                    quantity15 = quan15;
                                  });
                                }
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 90.0,
                            height: 49.0,
                            color: Colors.white,
                            child: DropdownButton<String>(
                              value: currentlySelected15,
                              isExpanded: true,
                              items: itemSelector
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  currentlySelected15 = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                  //The 'back' and 'next' buttons for this page.

                  SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {Navigator.pop(context);},
                            icon: Image.asset('assets/back-button-cookie.png',),
                            iconSize: 120.0,
                            style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0),),),),
                          ),
                          IconButton(
                            onPressed: () async {
                              allIngredientNames.addAll([ingredient1, ingredient2, ingredient3, ingredient4, ingredient5, ingredient6, ingredient7, ingredient8, ingredient9, ingredient10, ingredient11, ingredient12, ingredient13, ingredient14, ingredient15]);
                              allQuantities.addAll([quantity1, quantity2, quantity3, quantity4, quantity5, quantity6, quantity7, quantity8, quantity9, quantity10, quantity11, quantity12, quantity13, quantity14, quantity15]);
                              allUnits.addAll([currentlySelected1, currentlySelected2, currentlySelected3, currentlySelected4, currentlySelected5, currentlySelected6, currentlySelected7, currentlySelected8, currentlySelected9, currentlySelected10, currentlySelected11, currentlySelected12, currentlySelected13, currentlySelected14, currentlySelected15]);
                              if (_formKey.currentState!.validate() && currentlySelected1.isNotEmpty && currentlySelected2.isNotEmpty) {
                                await widget.addIngredients([ingredient1, ingredient2, ingredient3, ingredient4, ingredient5, ingredient6, ingredient7, ingredient8, ingredient9, ingredient10, ingredient11, ingredient12, ingredient13, ingredient14, ingredient15]);
                                widget.addQuantities([quantity1, quantity2, quantity3, quantity4, quantity5, quantity6, quantity7, quantity8, quantity9, quantity10, quantity11, quantity12, quantity13, quantity14, quantity15]);
                                widget.addUnits([currentlySelected1, currentlySelected2, currentlySelected3, currentlySelected4, currentlySelected5, currentlySelected6, currentlySelected7, currentlySelected8, currentlySelected9, currentlySelected10, currentlySelected11, currentlySelected12, currentlySelected13, currentlySelected14, currentlySelected15]);
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return const FourthSubmitPage(); }),);
                              }else{
                                print('Error!');
                              }
                            },
                            icon: Image.asset('assets/next-button-cake.png',),
                            iconSize: 120.0,
                            style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0),),),),
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
























///This class enables users to enter instructions for the recipe, which are
///then stored in the database reference already created during the call to
///RecipeCategory.  The text field on this page has an error check which requires
///users to enter at least 150 characters before the information can be submitted.
///This class is called on submitpage4.


class RecipeInstructions extends StatefulWidget {
  const RecipeInstructions({required this.addInstructions, super.key});
  final FutureOr<void> Function(String instructions) addInstructions;

  @override
  State<RecipeInstructions> createState() => _RecipeInstructionsState();
}

class _RecipeInstructionsState extends State<RecipeInstructions> {

  final _formKey = GlobalKey<FormState>(debugLabel: '_RecipeInstructionsState');
  String instructions = '';

  setInstructions (instructions){
    this.instructions = instructions;
  }
  getInstructions (){
    return instructions;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lightBlue.shade200,
      child: SingleChildScrollView(
        child: Container(
          width: 450.0,
          padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
          child: Form(
            key:  _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Submit Recipe',
                    style: TextStyle(
                      fontSize: 34.0,
                      fontFamily: 'Candy',
                    ),
                  ),
                ),
                const SizedBox(height: 20.0,),
                const SizedBox(
                  child: Center(
                    child: Text(
                      'Please include step-by-step instructions.',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0,),
                const SizedBox(
                  child: Center(
                    child: Text(
                      'We recommend NUMBERING your directions!',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25.0,),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          width: 380.0,
                          height: 360.0,
                          color: Colors.white,
                          child: TextFormField(
                            validator: (val){
                              if (val == null || val.isEmpty || val.length < 150 ){
                                return '   Please include more details!';
                              }
                              return null;
                            },
                            maxLines: null,
                            onChanged: (val){
                              setState(() => setInstructions(val));
                            },
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 18.0,
                              fontFamily: 'Grenze',
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Write detailed instructions here...',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {Navigator.pop(context);},
                          icon: Image.asset('assets/back-button-cookie.png'),
                          iconSize: 120.0,
                          style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0),),),),
                        ),
                        IconButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await widget.addInstructions(instructions);
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return const FifthSubmitPage(); }),);
                            }else{
                              print('Error!');
                            }
                          },
                          icon: Image.asset('assets/next-button-cake.png'),
                          iconSize: 120.0,
                          style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0),),),),
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


























///A class which allows user to submit any notes or images for the recipe, and
///then stores them in the document reference that every class before it has 
///submitted data to. There are no error checks here as both fields are optional.
///If an image is submitted which uses an invalid URL (or no image is submitted
///at all), there is a check in the recipe_services.dart file which will return
///a pre-planned image in place of a user image if there is any error.  This
///class is called on submitpage5, and represents the last step in the creation
///process of a recipe.


class RecipeNotesAndImage extends StatefulWidget {
  const RecipeNotesAndImage({required this.addNotes, required this.addImage, super.key});
  final FutureOr<void> Function(String notes) addNotes;
  final FutureOr<void> Function(String image) addImage;

  @override
  State<RecipeNotesAndImage> createState() => _RecipeNotesAndImageState();
}

class _RecipeNotesAndImageState extends State<RecipeNotesAndImage> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_RecipeInstructionsState');
  String notes = '';
  String imageURL = '';

  setNotes (notes){
    this.notes = notes;
  }
  getNotes (){
    return notes;
  }

  setImage (image){
    imageURL = image;
  }
  getImage (){
    return imageURL;
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lightBlue.shade200,
      child: SingleChildScrollView(
        child: Container(
          width: 450.0,
          padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Submit Recipe',
                    style: TextStyle(
                      fontSize: 34.0,
                      fontFamily: 'Candy',
                    ),
                  ),
                ),
                const SizedBox(height: 15.0,),
                const SizedBox(
                  child: Center(
                    child: Text(
                      'Are there any notes you would like to supply',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  child: Center(
                    child: Text(
                      'to fellow bakers? These could be tips you',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  child: Center(
                    child: Text(
                      'have found to make your recipe even better!',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontFamily: 'Grenze',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0,),
                SizedBox(
                  width: 380.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          width: 380.0,
                          height: 225.0,
                          color: Colors.white,
                          child: TextFormField(
                            maxLines: null,
                            onChanged: (val){
                              setState(() => setNotes(val));
                            },
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 18.0,
                              fontFamily: 'Grenze',
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Write any notes here (optional)...',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const SizedBox(
                        height: 40.0,
                        child: Center(
                          child: Text(
                            'Submit an Image URL here:',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontFamily: 'Grenze',
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          width: 380.0,
                          height: 60.0,
                          color: Colors.white,
                          child: TextFormField(
                            onChanged: (val){
                              setState(() => setImage(val));
                            },
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 18.0,
                              fontFamily: 'Grenze',
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Image URL (optional)',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {Navigator.pop(context);},
                          icon: Image.asset('assets/back-button-cookie.png',),
                          iconSize: 120.0,
                          style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0),),),),
                        ),
                        IconButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await widget.addNotes(notes);
                              widget.addImage(imageURL);
                            }
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return const FinalSubmitPage(); }),);
                          },
                          icon: Image.asset('assets/submit-final-button.png',),
                          iconSize: 120.0,
                          style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0),),),),
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}