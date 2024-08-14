import 'package:flutter/material.dart';

class NewRecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Category'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Ingredients'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Steps'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle save recipe
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
