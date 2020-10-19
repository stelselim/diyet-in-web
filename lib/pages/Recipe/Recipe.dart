import 'package:diyetinweb/components/general/appBar.dart';
import 'package:diyetinweb/components/home/RecipeCard.dart';
import 'package:diyetinweb/pages/ReadingPages/recipeReading.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:flutter/material.dart';

class Recipe extends StatelessWidget {
  const Recipe({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int crossAxisCount = MediaQuery.of(context).size.width > 620 ? 4 : 2;
    int lookingNewNumber = 8;
    int fitDesertNumber = 4;
    int fastRecipeNumber = 8;
    int lowCalorieNumber = 4;
    int highCalorieNumber = 4;

    fs.Firestore _firestore = firestore();

    final lookinNewRecipe = _firestore
        .collection(
            "/BeslenmeApp/AllDatas/Tarifler/Kategoriler/DeğişiklikArayanlar")
        .limit(lookingNewNumber)
        .orderBy('EklenmeTarihi', 'desc')
        .get();
    final fitDesertRecipe = _firestore
        .collection("/BeslenmeApp/AllDatas/Tarifler/Kategoriler/FitTatlılar")
        .limit(fitDesertNumber)
        .orderBy('EklenmeTarihi', 'desc')
        .get();
    final fastRecipe = _firestore
        .collection("/BeslenmeApp/AllDatas/Tarifler/Kategoriler/HızlıTarifler")
        .limit(fastRecipeNumber)
        .orderBy('EklenmeTarihi', 'desc')
        .get();
    final lowCalorie = _firestore
        .collection("/BeslenmeApp/AllDatas/Tarifler/Kategoriler/DüşükKalorili")
        .limit(lowCalorieNumber)
        .orderBy('EklenmeTarihi', 'asc')
        .get();
    final highCalorie = _firestore
        .collection("/BeslenmeApp/AllDatas/Tarifler/Kategoriler/YüksekKalorili")
        .limit(highCalorieNumber)
        .orderBy('EklenmeTarihi', 'desc')
        .get();

    var categoryTextStyle = TextStyle(
      color: Colors.blueGrey.shade700,
      fontSize: MediaQuery.of(context).size.width < 620 ? 20 : 25,
      fontWeight: FontWeight.w500,
    );
    return Scaffold(
      appBar: appBarWidget(title: "Diyet-in", context: context),
      body: ListView(
        physics: ScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: 20,
          ),

          // fast
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Pratik ve Hızlı Çözümler",
              style: categoryTextStyle,
            ),
          ),

          FutureBuilder<fs.QuerySnapshot>(
            future: fastRecipe,
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasError) return Text('Bir problem oluştu');

              if (snapshot.data == null) return Center(child: Container());

              return GridView.builder(
                  itemCount: fastRecipeNumber,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final data = snapshot.data.docs.elementAt(index);

                    return AspectRatio(
                      aspectRatio: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecipeReadingPage(
                                  data: data,
                                ),
                              ));
                        },
                        child: RecipeCard(
                          context: context,
                          recipeData: data,
                        ),
                      ),
                    );
                  });
            },
          ),
          SizedBox(
            height: 8,
          ),

          ///fit tatlı
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Fit Tatlılar",
              style: categoryTextStyle,
            ),
          ),

          FutureBuilder<fs.QuerySnapshot>(
            future: fitDesertRecipe,
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasError) return Text('Bir problem oluştu');

              if (snapshot.data == null) return Center(child: Container());

              return GridView.builder(
                  itemCount: fitDesertNumber,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final data = snapshot.data.docs.elementAt(index);

                    return AspectRatio(
                      aspectRatio: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecipeReadingPage(
                                  data: data,
                                ),
                              ));
                        },
                        child: RecipeCard(
                          context: context,
                          recipeData: data,
                        ),
                      ),
                    );
                  });
            },
          ),
          SizedBox(
            height: 8,
          ),

          // Değişiklik
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Değişiklik Arayanlar",
              style: categoryTextStyle,
            ),
          ),
          FutureBuilder<fs.QuerySnapshot>(
            future: lookinNewRecipe,
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasError) return Text('Bir problem oluştu');

              if (snapshot.data == null) return Center(child: Container());

              return GridView.builder(
                  itemCount: lookingNewNumber,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final data = snapshot.data.docs.elementAt(index);

                    return AspectRatio(
                      aspectRatio: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecipeReadingPage(
                                  data: data,
                                ),
                              ));
                        },
                        child: RecipeCard(
                          context: context,
                          recipeData: data,
                        ),
                      ),
                    );
                  });
            },
          ),
          SizedBox(
            height: 8,
          ),

          // Düşük kalori
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Düşük Kalorili",
              style: categoryTextStyle,
            ),
          ),
          FutureBuilder<fs.QuerySnapshot>(
            future: lowCalorie,
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasError) return Text('Bir problem oluştu');

              if (snapshot.data == null) return Center(child: Container());

              return GridView.builder(
                  itemCount: lowCalorieNumber,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final data = snapshot.data.docs.elementAt(index);

                    return AspectRatio(
                      aspectRatio: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecipeReadingPage(
                                  data: data,
                                ),
                              ));
                        },
                        child: RecipeCard(
                          context: context,
                          recipeData: data,
                        ),
                      ),
                    );
                  });
            },
          ),
          SizedBox(
            height: 8,
          ),

          /// High Calorie
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Yüksek Kalorili",
              style: categoryTextStyle,
            ),
          ),
          FutureBuilder<fs.QuerySnapshot>(
            future: highCalorie,
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasError) return Text('Bir problem oluştu');

              if (snapshot.data == null) return Center(child: Container());

              return GridView.builder(
                  itemCount: highCalorieNumber,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final data = snapshot.data.docs.elementAt(index);

                    return AspectRatio(
                      aspectRatio: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecipeReadingPage(
                                  data: data,
                                ),
                              ));
                        },
                        child: RecipeCard(
                          context: context,
                          recipeData: data,
                        ),
                      ),
                    );
                  });
            },
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
