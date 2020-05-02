import 'package:firebase/firestore.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  RecipeCard({
    BuildContext context,
    DocumentSnapshot recipeData,
  });

  Widget smallScreen() {
    return Container();
  }

  Widget largeScreen() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 500)
      return largeScreen();
    else {
      return smallScreen();
    }
  }
}
