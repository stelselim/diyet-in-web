import 'package:diyetinweb/backend/Streams/blogStream.dart';
import 'package:diyetinweb/backend/Streams/quoteFuture.dart';
import 'package:diyetinweb/backend/Streams/recipeStream.dart';
import 'package:diyetinweb/components/general/appBar.dart';
import 'package:diyetinweb/components/home/RecipeCard.dart';
import 'package:diyetinweb/components/home/blogCard.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream blogStream = firestore()
        .collection("/BeslenmeApp/AllDatas/Blog")
        .limit(10)
        .get()
        .asStream();

    fs.Firestore _firestore = firestore();

    Stream recipeStream = _firestore
        .collection(
            "/BeslenmeApp/AllDatas/Tarifler/Kategoriler/DeğişiklikArayanlar")
        .get()
        .asStream()
        .asBroadcastStream();

    return Scaffold(
      appBar: appBarWidget(title: "Diyet-in", context: context),
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: 10,
          ),

          /// Blog Yazıları
          Container(
            margin: EdgeInsets.all(6),
            height: MediaQuery.of(context).size.height * 0.33,
            child: StreamBuilder<fs.QuerySnapshot>(
              stream: blogStream,
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasError) return Text('Bir problem oluştu');

                if (snapshot.data == null)
                  return Center(child: CircularProgressIndicator());

                return ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final data = snapshot.data.docs.elementAt(index);

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BlogCard(
                        blogData: data,
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
          Container(
            child: FutureBuilder<fs.DocumentSnapshot>(
              future: quoteOfDay,
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                if (snapshot.hasError) return Text("Problem oluştu");

                List quote = snapshot.data.data()["sözler"];
                int index =
                    DateTime.now().day % snapshot.data.data()["sözler"].length;
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
          ),

        Container(
          height: 5000,
          color: Colors.blue,
        ),

          /* 
          StreamBuilder<fs.QuerySnapshot>(
            stream: recipeStream,
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasError) return Text('Bir problem oluştu');

              if (snapshot.data == null)
                return Center(child: CircularProgressIndicator());

              return GridView.builder(
                  itemCount: 8,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final data = snapshot.data.docs.elementAt(index);

                    return AspectRatio(
                      aspectRatio: 1,
                      child: RecipeCard(
                        context: context,
                        recipeData: data,
                      ),
                    );
                  });
            },
          )
         */
        ],
      ),
    );
  }
}
