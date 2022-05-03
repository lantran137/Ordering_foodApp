import 'package:flutter/material.dart';
import 'package:ordering_app/models/categories_model.dart';
import 'package:ordering_app/models/food_model.dart';
import 'package:ordering_app/provider/my_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoriesModel> burgerList = [];
  List<CategoriesModel> recipeList = [];
  List<CategoriesModel> pizzaList = [];
  List<CategoriesModel> drinkList = [];
  List<CategoriesModel> allList = [];
  List<FoodModel> singleFoodList = [];



  Widget categoriesContainer({@required String image, String name}) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image)),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10)),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ],
    );
  }
  Widget bottomContainer({@required String image, int price, String name}){
    return Container(
            height: 270,
            width: 200,
            decoration: BoxDecoration(
              color: Color(0xff3a3e3e),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(image),
                ),
                ListTile(
                  leading: Text(
                    name,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Text(
                    "\$ $price",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,size: 20,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.star,size: 20,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.star,size: 20,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.star,size: 20,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.star,size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }

  Widget drawerItem({@required String name, IconData icon}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        name,
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget burger(){
    return Row(
      children: burgerList.map((e) => categoriesContainer(
        image: e.image,
        name: e.name
      )).toList(),
    );
  }

  Widget recipe(){
    return Row(
      children: recipeList.map((e) => categoriesContainer(
        image: e.image,
        name: e.name
      )).toList(),
    );
  }

  Widget pizza(){
    return Row(
      children: pizzaList.map((e) => categoriesContainer(
        image: e.image,
        name: e.name
      )).toList(),
    );
  }

  Widget drink(){
    return Row(
      children: drinkList.map((e) => categoriesContainer(
        image: e.image,
        name: e.name
      )).toList(),
    );
  }

  Widget all(){
    return Row(
      children: allList.map((e) => categoriesContainer(
        image: e.image,
        name: e.name
      )).toList(),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    //Burger
    provider.getBurgerCategory();
    burgerList = provider.throwBurgerList;
    //Recipe
    provider.getRecipeCaregory();
    recipeList = provider.throwRecipeList;
    //Pizza
    provider.getPizzaCaregory();
    pizzaList = provider.throwPizzaList;
    //Drink
    provider.getDrinkCaregory();
    drinkList = provider.throwDrinkList;
    //All
    provider.getAllCaregory();
    allList = provider.throwAllList;
    //single food
    provider.getFoodList();
    singleFoodList = provider.throwFoodModelList;
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color(0xff2b2b2b),
          child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/background.jpg')
                  )
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/profile.jpg'),
                ),
                accountName: Text("Lân Nè"),
                accountEmail: Text("TestMail@gmail.com"),
              ),
              drawerItem(
                icon: Icons.person,
                name: "Profile"
              ),
              drawerItem(
                icon: Icons.add_shopping_cart,
                name: "Cart"
              ),
              drawerItem(
                icon: Icons.shopping_bag,
                name: "Order"
              ),
              drawerItem(
                icon: Icons.info,
                name: "About"
              ),
              Divider(
                thickness: 2,
                color: Colors.white,
              ),
              ListTile(
                leading: Text(
                "Communicate",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              ),
              
              drawerItem(
                icon: Icons.lock,
                name: "Change"
              ),
              drawerItem(
                icon: Icons.exit_to_app,
                name: "Log out"
              ),
            ],
          )),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('images/profile.jpg'),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search food",
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.search, color: Colors.white,),
                filled: true,
                fillColor: Color(0xff3a3e3e),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                all(),
                burger(),
                pizza(),
                drink(),
                recipe(),
                /*categoriesContainer(
                  image: 'images/1.png',
                  name: "All"
                ),
                categoriesContainer(
                  image: 'images/2.png',
                  name: "Burger"
                ),
                categoriesContainer(
                  image: 'images/3.png',
                  name: "Recipes"
                ),
                categoriesContainer(
                  image: 'images/4.png',
                  name: "Pizza"
                ),
                categoriesContainer(
                  image: 'images/5.png',
                  name: "Drink"
                ),*/
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 400,
            child: GridView.count(
              shrinkWrap: false,
              primary: false,
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
                children: singleFoodList.map((e) => bottomContainer(
                      image: e.image,
                      price: e.price,
                      name: e.name,
                    ),
                  ).toList()
              /*children: [
                bottomContainer(
                  image: 'images/1.jpg',
                  name: 'Pizza 1',
                  price: 50
                ),
                bottomContainer(
                  image: 'images/1.png',
                  name: 'Pizza 2',
                  price: 45
                ),
                bottomContainer(
                  image: 'images/3.png',
                  name: 'Pizza 3',
                  price: 45
                ),
                bottomContainer(
                  image: 'images/6.png',
                  name: 'Pizza 4',
                  price: 45
                ),
              ],*/
            ),
          )
          
        ],
      ),
    );
  }
}