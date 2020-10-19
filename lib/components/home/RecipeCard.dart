import 'package:firebase/firestore.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  RecipeCard({
    BuildContext context,
    @required this.recipeData,
  });

  final DocumentSnapshot recipeData;

  @override
  Widget build(BuildContext context) {
    String name = recipeData.data()["Tarifinİsmi"];

    if (name.length > 16) {
      name = name.substring(0, 16) + '...';
    }

    final String pic = recipeData.data()["Resim"];
    final String cook = recipeData.data()["YapanKişi"];
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(
                        image: NetworkImage(
                          pic,
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Column(
                  children: [
                    Text(
                      "$name",
                      textAlign: TextAlign.center,
                      style: recipeNameTextStyle,
                       textScaleFactor: 1.1,
                    ),
                    Text(
                      "$cook",
                      style: cookNameTextStyle,
                      textScaleFactor: 0.9,
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

const recipeNameTextStyle = TextStyle(
  color: Colors.blueGrey,
  fontWeight: FontWeight.w500,
  //fontSize: 14,
);
const cookNameTextStyle = TextStyle(
  color:Colors.lightGreen,
  fontWeight: FontWeight.w400,
 // fontSize: 12,
);
