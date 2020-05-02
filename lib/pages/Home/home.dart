import 'package:diyetinweb/components/general/appBar.dart';
// import 'package:firebase/firebase.dart';
// import 'package:firebase/firestore.dart' as fs;
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(title: "Diyet-in", context: context),
      body: ListView(
        physics: ScrollPhysics(),
        children: <Widget>[
          /// Blog Yazıları
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AspectRatio(
                    aspectRatio: 1.5,
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                );
              },
            ),
          ),

          /// Tariflerin Kategorileri
          SizedBox(
            height: 120,
            child: GridView(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    width: 60,
                    child: Text('Hey'),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    width: 60,
                    child: Text('Hey'),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    width: 60,
                    child: Text('Hey'),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    width: 60,
                    child: Text('Hey'),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    width: 60,
                    child: Text('Hey'),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    width: 60,
                    child: Text('Hey'),
                  ),
                ),
              ],
            ),
          ),

          /// Günün Sözü
          Container(
            height: 150,
            width: 250,
            child: Text("Bugünün Sözü"),
          ),

          /// Son Eklenen Tarifler
          GridView.builder(
              itemCount: 25,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(50),
                  child: Text('Gss'),
                );
              })
        ],
      ),
    );
  }
}
