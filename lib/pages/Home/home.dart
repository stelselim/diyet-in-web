import 'package:diyetinweb/components/general/appBar.dart';
import 'package:diyetinweb/components/home/RecipeCard.dart';
import 'package:diyetinweb/components/home/blogCard.dart';
import 'package:diyetinweb/pages/ReadingPages/blogReading.dart';
import 'package:diyetinweb/pages/ReadingPages/recipeReading.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  static final categories = [
    "DeğişiklikArayanlar",
    "DüşükKalorili",
    "FitTatlılar",
    "HızlıTarifler",
    "YüksekKalorili",
  ];

  @override
  Widget build(BuildContext context) {
    int todayCat1 = DateTime.now().day % categories.length;
    int tomorrowCat = (DateTime.now().day+2) % categories.length;

    final blogFuture = firestore()
        .collection("/BeslenmeApp/AllDatas/Blog")
        .orderBy('EklenmeTarihi', 'desc')
        .limit(10)
        .get();
    fs.Firestore _firestore = firestore();

    Stream lookinNewRecipe = _firestore
        .collection(
            "/BeslenmeApp/AllDatas/Tarifler/Kategoriler/${categories[todayCat1]}")
        .limit(4)
        .orderBy('EklenmeTarihi', 'desc')
        .get()
        .asStream()
        .asBroadcastStream();
    Stream fitDesertRecipe = _firestore
        .collection("/BeslenmeApp/AllDatas/Tarifler/Kategoriler/${categories[tomorrowCat]}")
        .limit(4)
        .orderBy('EklenmeTarihi', 'desc')
        .get()
        .asStream()
        .asBroadcastStream();

    return Scaffold(
      appBar: appBarWidget(title: "Diyet-in", context: context),
      body: Container(
        color: Colors.blueGrey.shade50,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                // shrinkWrap: true,
                // physics: ScrollPhysics(),
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),

                  /// Blog Yazıları
                  Container(
                    // color: Colors.blue,
                    margin: EdgeInsets.all(6),
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: FutureBuilder<fs.QuerySnapshot>(
                      future: blogFuture,
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.hasError)
                          return Text('Bir problem oluştu');

                        if (snapshot.data == null)
                          return Center(child: CircularProgressIndicator());

                        return ListView.builder(
                          itemCount: 10,
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final data = snapshot.data.docs.elementAt(index);

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BlogReadingPage(
                                          data: data,
                                        ),
                                      ));
                                },
                                child: BlogCard(
                                  blogData: data,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Günün Sözü",
                      style: TextStyle(color: Colors.black54),
                      textScaleFactor: 1.35,
                    ),
                  ),

                  /// Günün Sözü
                  FutureBuilder<fs.DocumentSnapshot>(
                    future: firestore()
                        .collection("/BeslenmeApp/AllDatas/GününSözü")
                        .doc("doc")
                        .get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      if (snapshot.hasError) return Text("Problem oluştu");

                      List quote = snapshot.data.data()["sözler"];
                      int index = DateTime.now().day %
                          snapshot.data.data()["sözler"].length;
                      // Günün Sözü Kartı yazılıp eklencek.
                      return Container(
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: Card(
                          color: Colors.blueGrey.shade100,
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20.0,
                              horizontal: 12,
                            ),
                            child: Text(
                              quote[index],
                              textScaleFactor: 1.25,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Özenle Hazırlanmış Tarifler",
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.35,
                    ),
                    height: 50,
                  ),

                  StreamBuilder<fs.QuerySnapshot>(
                    stream: lookinNewRecipe,
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasError) return Text('Bir problem oluştu');

                      if (snapshot.data == null)
                        return Center(child: CircularProgressIndicator());

                      return GridView.builder(
                          itemCount: 2,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
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

                  StreamBuilder<fs.QuerySnapshot>(
                    stream: fitDesertRecipe,
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasError) return Text('Bir problem oluştu');

                      if (snapshot.data == null)
                        return Center(child: Container());

                      return GridView.builder(
                          itemCount: 4,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
