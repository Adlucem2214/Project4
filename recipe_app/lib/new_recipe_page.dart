import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewRecipePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NewRecipePage extends StatefulWidget {
  @override
  _NewRecipePageState createState() => _NewRecipePageState();
}

class _NewRecipePageState extends State<NewRecipePage> {
  Uint8List? _recipeImage;
  final List<Map<String, dynamic>> _ingredients = [];
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _recipeImage = bytes;
      });
    }
  }

  Future<void> _addIngredient() async {
    final nameController = TextEditingController();
    Uint8List? ingredientImage;

    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Add Ingredient'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Ingredient Name'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () async {
                final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  final bytes = await pickedFile.readAsBytes();
                  setState(() {
                    ingredientImage = bytes;
                  });
                }
              },
              child: Text('Choose Image'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (nameController.text.isNotEmpty && ingredientImage != null) {
                setState(() {
                  _ingredients.add({
                    'name': nameController.text,
                    'image': ingredientImage,
                  });
                });
                Navigator.of(ctx).pop();
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
          },
        ),
        title: Text(
          'New Recipe',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 24.0),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: _recipeImage == null
                    ? Center(
                        child: Text(
                          '360 x 320',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : Image.memory(_recipeImage!, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 24.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Category',
                border: UnderlineInputBorder(),
              ),
              items: <String>['Category 1', 'Category 2', 'Category 3']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {
               
              },
            ),
            SizedBox(height: 24.0),
            Text('Ingredients'),
            SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ingredient Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    enabled: false,
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  onPressed: _addIngredient,
                  icon: Icon(Icons.add_circle, color: Colors.orange),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ..._ingredients.map((ingredient) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.grey[200],
                ),
                child: ListTile(
                  leading: Image.memory(
                    ingredient['image'],
                    width: 50,
                  ),
                  title: Text(ingredient['name']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            _ingredients.remove(ingredient);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
            SizedBox(height: 24.0),
            Text('Steps'),
            SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Step 1',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  onPressed: () {
                   
                  },
                  icon: Icon(Icons.add_circle, color: Colors.orange),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:Color(0xFFFF5900), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text(
                'Save',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
