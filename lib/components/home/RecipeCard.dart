import 'package:firebase/firestore.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  RecipeCard({
    BuildContext context,
    DocumentSnapshot recipeData,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      height: 125,
      child: Text("se"),
    );
  }
}
