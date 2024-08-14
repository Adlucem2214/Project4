import 'package:flutter/material.dart';
import 'package:recipe_app/welcome.dart';
import 'login_page.dart';
import 'recipe_detail_page.dart';
import 'signup_page.dart';
import 'new_recipe_page.dart';

void main() {
  runApp(FlavchemyApp());
}

class FlavchemyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flavchemy',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: WelcomePage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/recipe': (context) => RecipeDetailPage(),
        '/new-recipe': (context) => NewRecipePage(),
      },
    );
  }
}
