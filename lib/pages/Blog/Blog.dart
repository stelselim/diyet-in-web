import 'package:diyetinweb/components/general/appBar.dart';
import 'package:diyetinweb/components/home/blogCard.dart';
import 'package:diyetinweb/pages/ReadingPages/blogReading.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:flutter/material.dart';

class Blog extends StatelessWidget {
  const Blog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boundX = 800;
//MediaQuery.of(context).size.width>620?

    final blogFuture = firestore()
        .collection("/BeslenmeApp/AllDatas/Blog")
        .orderBy('EklenmeTarihi', 'desc')
        .limit(20)
        .get();

    return Scaffold(
      appBar: appBarWidget(title: "Diyet-in", context: context),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          color: Colors.blueGrey.shade50,
          child: Column(
            children: <Widget>[
              Expanded(
                child: FutureBuilder<fs.QuerySnapshot>(
                  future: blogFuture,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasError) return Text('Bir problem oluştu');

                    if (snapshot.data == null)
                      return Center(child: CircularProgressIndicator());

                    if (MediaQuery.of(context).size.width > 620) {
                      return GridView.builder(
                        itemCount: 20,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          final data = snapshot.data.docs.elementAt(index);

                          return Container(
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
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: BlogCard(
                                  blogData: data,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return GridView.builder(
                        itemCount: 20,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          final data = snapshot.data.docs.elementAt(index);

                          return Container(
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
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: BlogCard(
                                  blogData: data,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
