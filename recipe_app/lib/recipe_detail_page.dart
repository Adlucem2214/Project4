import 'package:flutter/material.dart';
import 'package:recipe_app/steps.dart';

class RecipeDetailPage extends StatelessWidget {
  final String title;
  final String image;
  final String preparationTime;
  final List<Map<String, String>> ingredients;

  RecipeDetailPage({
    required this.title,
    required this.image,
    required this.preparationTime,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                   Text(
                                title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                                     Text(
                                  'Preparation Time: $preparationTime',
                                  style: TextStyle(
                                    color: const Color.fromARGB(225, 255, 255, 255),
                                    fontSize: 16,
                                  ),
                                ),
                                ],
                              ),
                              
                          CircleAvatar(
                            backgroundColor:Color(0xFFFF5900),
                            child: IconButton(
                              icon: Icon(Icons.play_arrow, color: Colors.white),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProcedureScreen(
                                      videoPath: 'image/vid2.mp4', 
                                      steps: [
                                        'Beat egg whites in a glass, metal, or ceramic bowl until stiff peaks form.',
                                        'Butter enough 3 1/2-inch ring molds to fill your frying pan. Place molds in the pan over low heat. Cover.',
                                        'Mix flour, sugar, baking powder, and baking soda in a bowl.',
                                        'Combine buttermilk, egg yolks, butter, and vanilla extract in a separate bowl. Add the flour mixture and stir until batter is fairly smooth.',
                                        'Fold egg whites into the batter until combined. Small bits of egg whites still showing is ok.',
                                        'Pour about 1/2 cup of batter into each mold and cover the pan. Cook until bubbles start forming and...',
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )

                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Ingredients',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: ingredients.map((ingredient) {
                      return Card(
                        margin: EdgeInsets.only(bottom: 16), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 8, 
                            horizontal: 8,
                          ),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              ingredient['image']!,
                              width: 50, 
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            ingredient['name']!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            left: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                backgroundColor: Color(0xFFFF5900),
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
