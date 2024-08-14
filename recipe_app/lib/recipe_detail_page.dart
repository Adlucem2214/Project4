import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fluffy Pancakes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fluffy Pancakes',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Preparation Time: 30min'),
            SizedBox(height: 20),
            Text('Ingredients', style: TextStyle(fontSize: 20)),
            Text('2 Eggs separated'),
            Text('1 & 1/2 All-purpose Flour'),
            Text('1/4 Cups White Sugar'),
            Text('2 Teaspoons baking Powder'),
            Text('1/2 Teaspoon Baking Soda'),
            // Add more ingredients...
            SizedBox(height: 20),
            Text('Steps', style: TextStyle(fontSize: 20)),
            Text('1. Beat egg whites in a glass, metal, or ceramic bowl...'),
            Text('2. Butter enough 3 1/2-inch ring molds...'),
            // Add more steps...
          ],
        ),
      ),
    );
  }
}
