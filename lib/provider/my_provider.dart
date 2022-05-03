import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:ordering_app/models/categories_model.dart';
import 'package:ordering_app/models/food_model.dart';

class MyProvider extends ChangeNotifier{
  List<CategoriesModel> burgerList = [];
  CategoriesModel burgerModel;
  Future<void> getBurgerCategory()async{
    List<CategoriesModel> newBurgerList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('categories').doc('YYuQCvpT0CbKlBXpwLlC').collection('Burger').get();
    querySnapshot.docs.forEach((element) {
      burgerModel = CategoriesModel(
        image: element.data()['image'],
        name: element.data()['name']
        );
        newBurgerList.add(burgerModel);
        burgerList = newBurgerList;
    });
    notifyListeners();
  }
  get throwBurgerList{
    return burgerList;
  }

  //Recipe//
  List<CategoriesModel> recipeList = [];
  CategoriesModel recipeModel;
  Future<void> getRecipeCaregory()async{
    List<CategoriesModel> newRecipeList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('categories').doc('YYuQCvpT0CbKlBXpwLlC').collection('Recipes').get();
    querySnapshot.docs.forEach((element) {
      recipeModel = CategoriesModel(
        image: element.data()['image'],
        name: element.data()['name']
        );
        newRecipeList.add(recipeModel);
        recipeList = newRecipeList;
    });
        notifyListeners();

  }
  get throwRecipeList{
    return recipeList;
  }

  //Pizza//
  List<CategoriesModel> pizzaList = [];
  CategoriesModel pizzaModel;
  Future<void> getPizzaCaregory()async{
    List<CategoriesModel> newPizzaList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('categories').doc('YYuQCvpT0CbKlBXpwLlC').collection('Pizza').get();
    querySnapshot.docs.forEach((element) {
      pizzaModel = CategoriesModel(
        image: element.data()['image'],
        name: element.data()['name']
        );
        newPizzaList.add(pizzaModel);
        pizzaList = newPizzaList;
    });
        notifyListeners();

  }
  get throwPizzaList{
    return pizzaList;
  }

  //Drink//
  List<CategoriesModel> drinkList = [];
  CategoriesModel drinkModel;
  Future<void> getDrinkCaregory()async{
    List<CategoriesModel> newDrinkList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('categories').doc('YYuQCvpT0CbKlBXpwLlC').collection('Drink').get();
    querySnapshot.docs.forEach((element) {
      drinkModel = CategoriesModel(
        image: element.data()['image'],
        name: element.data()['name']
        );
        newDrinkList.add(drinkModel);
        drinkList = newDrinkList;
    });
        notifyListeners();

  }
  get throwDrinkList{
    return drinkList;
  }

  //All//
  List<CategoriesModel> AllList = [];
  CategoriesModel AllModel;
  Future<void> getAllCaregory()async{
    List<CategoriesModel> newAllList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('categories').doc('YYuQCvpT0CbKlBXpwLlC').collection('All').get();
    querySnapshot.docs.forEach((element) {
      AllModel = CategoriesModel(
        image: element.data()['image'],
        name: element.data()['name']
        );
        newAllList.add(AllModel);
        AllList = newAllList;
    });
        notifyListeners();

  }
  get throwAllList{
    return AllList;
  }

  //Food model//
  List<FoodModel> foodModelList = [];
  FoodModel foodModel;
  Future<void> getFoodList() async {
    List<FoodModel> newSingleFoodList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('foods').get();
    querySnapshot.docs.forEach(
      (element) {
        foodModel = FoodModel(
          name: element.data()['name'],
          image: element.data()['image'],
          price: element.data()['price'],
        );
        newSingleFoodList.add(foodModel);
      },
    );

    foodModelList = newSingleFoodList;
    notifyListeners();
  }

  get throwFoodModelList {
    return foodModelList;
  }
}