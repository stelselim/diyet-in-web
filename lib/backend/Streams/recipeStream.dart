import 'package:diyetinweb/components/home/RecipeCard.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;

Widget recipeStreamHome(BuildContext context) {
  fs.Firestore _firestore = firestore();

  Stream recipeStream = _firestore
      .collection(
          "/BeslenmeApp/AllDatas/Tarifler/Kategoriler/DeğişiklikArayanlar")
      .get()
      .asStream()
      .asBroadcastStream();

  return StreamBuilder<fs.QuerySnapshot>(
    stream: recipeStream,
    builder: (BuildContext context, snapshot) {
      if (snapshot.hasError) return Text('Bir problem oluştu');

      if (snapshot.data == null)
        return Center(child: CircularProgressIndicator());

      return GridView.builder(
          itemCount: 8,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            final data = snapshot.data.docs.elementAt(index);

            return RecipeCard(
              context: context,
              recipeData: data,
            );
          });
    },
  );
}
