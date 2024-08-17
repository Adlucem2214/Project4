import 'package:flutter/material.dart';
import 'package:recipe_app/new_recipe_page.dart';
import 'package:recipe_app/recipe_detail_page.dart';

void main() {
  runApp(FlavchemyApp());
}

class FlavchemyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flavchemy',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Breakfast';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Flavchemy', style: TextStyle(color: Colors.black)),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('image/avater3.jpg'),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Container(
        color: Colors.white, 
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                
                Container(
                  width: double.infinity,
                  height: 170, // Increased height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage('image/card2.jpg'),
                      fit: BoxFit.cover, 
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), 
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
             
                Text(
                  'Recommendation',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                _buildRecommendationSection(context),
                SizedBox(height: 20),
              
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                _buildCategorySection(),
                SizedBox(height: 20),
            
                Text(
                  selectedCategory,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                _buildRecipeList(context),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFFFF5900),),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => NewRecipePage()));
        },
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Color(0xFFFF5900),
        shape: CircleBorder(), 
      ),
    );
  }

  Widget _buildRecommendationSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: SizedBox(
        height: 150,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildFoodCard(context, 'Strawberry Waffles', 'image/strwaffle.jpg'),
            _buildFoodCard(context, 'Beet Burger', 'image/burger1.jpg'),
            _buildFoodCard(context, 'Spaghetti', 'image/pasta.jpg'),
            _buildFoodCard(context, 'Chocolate Cheese Cake', 'image/cake.jpg'),
            _buildFoodCard(context, 'Strawberry Milk Shake', 'image/stwmilk.jpg'),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCategoryChip('Breakfast'),
          _buildCategoryChip('Lunch'),
          _buildCategoryChip('Dinner'),
          _buildCategoryChip('Dessert'),
          _buildCategoryChip('Beverages'),
        ],
      ),
    );
  }

Widget _buildCategoryChip(String label) {
  final isSelected = selectedCategory == label;
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          selectedCategory = label;
        });
      },
      selectedColor: Color(0xFFFF5900), 
      backgroundColor: Colors.white, 
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Color(0xFFFF5900),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), 
        side: BorderSide(
          color: isSelected ? Color(0xFFFF5900) : Color(0xFFFF5900), 
          width: 1, 
        ),
      ),
      visualDensity: VisualDensity.compact,
    ),
  );
}


  Widget _buildRecipeList(BuildContext context) {
    if (selectedCategory == 'Breakfast') {
      return Column(
        children: [
          _buildVerticalFoodCard(context, 'Fluffy Pancake', 'image/FluffyPancake.jpg'),
          _buildVerticalFoodCard(context, 'Crepe', 'image/Crepe.jpg'),
          _buildVerticalFoodCard(context, 'Omlete Sandwich', 'image/omlete sandwich.jpg'),
          _buildVerticalFoodCard(context, 'Hot Dog', 'image/hotdog.jpg'),
          _buildVerticalFoodCard(context, 'French Toast','image/FrenchToast.jpg'),
        ],
      );
    } else if (selectedCategory == 'Lunch') {
      return Column(
        children: [
          _buildVerticalFoodCard(context, 'Chicken Salad', 'image/ChickenSalad.jpg'),
          _buildVerticalFoodCard(context, 'Grilled Sandwich', 'image/GrilledSandwich.jpg'),
          _buildVerticalFoodCard(context, 'Burger', 'image/Burger.jpg'),
          _buildVerticalFoodCard(context, 'Pasta', 'image/Pasta.jpg'),
          _buildVerticalFoodCard(context, 'Steak', 'image/Steak.jpg'),
        ],
      );
    }
   
    return Container();
  }

Widget _buildFoodCard(BuildContext context, String title, String image) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipeDetailPage(
            title: title,
            image: image,
            preparationTime: '30min',
            ingredients: [
              {'name': '2 Eggs separated', 'image': 'image/eggs.jpg'},
              {'name': '1 & 1/2 All-purpose Flour', 'image': 'image/flour.jpg'},
              {'name': '1/4 Cups White Sugar', 'image': 'image/sugar.jpg'},
              {'name': '2 Teaspoons Baking Powder', 'image': 'image/baking_powder.jpg'},
              {'name': '1/2 Teaspoon Baking Soda', 'image': 'image/baking_soda.jpg'},
            ],
          ),
        ),
      );
    },
    child: Container(
      margin: EdgeInsets.only(right: 10),
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
  );
}


Widget _buildVerticalFoodCard(BuildContext context, String title, String image) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipeDetailPage(
            title: title,
            image: image,
            preparationTime: '30min',  
            ingredients: [
              {'name': '2 Eggs separated', 'image': 'image/eggs2.jpg'},
              {'name': '1 & 1/2 All-purpose Flour', 'image': 'image/flour1.jpg'},
              {'name': '1/4 Cups White Sugar', 'image': 'image/sugar2.jpg'},
              {'name': '2 Teaspoons Baking Powder', 'image': 'image/bp.jpg'},
              {'name': '1/2 Teaspoon Baking Soda', 'image': 'image/bs.jpg'},
            ],
          ),
        ),
      );
    },
    child: Card(
      margin: EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Delicious and fluffy pancakes to start your day!',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      Icon(Icons.star_half, color: Colors.orange, size: 16),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

}
