import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:diyetinweb/components/general/appBar.dart';
import 'package:diyetinweb/components/home/RecipeCard.dart';
import 'package:diyetinweb/components/home/blogCard.dart';
import 'package:diyetinweb/lib-large/pages/Home/largeCarouselItems.dart';
import 'package:diyetinweb/pages/ReadingPages/blogReading.dart';
import 'package:diyetinweb/pages/ReadingPages/recipeReading.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:flutter/material.dart';

class LargeHome extends StatelessWidget {
  const LargeHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index = 0;

    CarouselController carouselController = CarouselController();
    ScrollController scrollController = ScrollController(
      initialScrollOffset: 1400,
    );
    carouselController.previousPage();

    final blogFuture = firestore()
        .collection("/BeslenmeApp/AllDatas/Blog")
        .orderBy('EklenmeTarihi', 'desc')
        .limit(10)
        .get();
    fs.Firestore _firestore = firestore();

    return Scaffold(
      appBar: appBarWidget(title: "Diyet-in", context: context),
      body: Container(
        color: Colors.blueGrey.shade100,
        child: Center(
          child: Container(
            width: 1000,
            color: Colors.blueGrey.shade50,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              icon: Icon(Icons.navigate_before, size: 35),
                              onPressed: () {
                                carouselController.previousPage();
                              }),
                          IconButton(
                              icon: Icon(
                                Icons.navigate_next,
                                size: 35,
                              ),
                              onPressed: () {
                                carouselController.nextPage();
                              })
                        ],
                      ),

                      Container(
                        alignment: Alignment.center,
                        height: 450,
                        //color: Colors.blueGrey.shade200,
                        child: CarouselSlider(
                          carouselController: carouselController,
                          options: CarouselOptions(
                            autoPlay: true,
                            autoPlayInterval:
                                Duration(seconds: 4, milliseconds: 500),
                            height: 400.0,
                            enlargeCenterPage: true,
                            initialPage: 0,
                          ),
                          items: [
                            CarouselOne(),
                            CarouselTwo(),
                            CarouselThree(),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      /// Blog Yazıları
                      Container(
                        // color: Colors.blue
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.37,
                        child: FutureBuilder<fs.QuerySnapshot>(
                          future: blogFuture,
                          builder: (BuildContext context, snapshot) {
                            if (snapshot.hasError)
                              return Text('Bir problem oluştu');

                            if (snapshot.data == null)
                              return Center(child: CircularProgressIndicator());

                            return ListView.builder(
                              controller: scrollController,
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final data =
                                    snapshot.data.docs.elementAt(index);

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BlogReadingPage(
                                              data: data,
                                            ),
                                          ));
                                    },
                                    child: BlogCardLarge(
                                      blogData: data,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BlogCardLarge extends StatelessWidget {
  final fs.DocumentSnapshot blogData;

  BlogCardLarge({
    @required this.blogData,
  });

  Widget largeCard(context) {
    String pictureURL = blogData.data()["Resim"];

    String header = blogData.data()['Başlık'];
    if (header.length > 49) {
      header = header.substring(0, 48) + '...';
    }
    String characters =
        blogData.data()["BlogYazısı"] + blogData.data()["AnaDüşünce"];

    int characterNumber = characters.length;
    num timeToRead = (characterNumber / 150) / 6;
    timeToRead = timeToRead.round();

    return AspectRatio(
      aspectRatio: 1.4,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 7,
              child: AspectRatio(
                aspectRatio: 4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(
                        image: NetworkImage(
                          pictureURL,
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
                      "$header",
                      textAlign: TextAlign.center,
                      style: blogTitleStyle,
                      textScaleFactor: 1.2,
                    ),
                    Text("$timeToRead Dakika Okuma",
                        style: blogMinuteStyle, textScaleFactor: 1.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return largeCard(context);
  }
}

const blogTitleStyle = TextStyle(
  decorationColor: Colors.black54,
//  fontSize: 13,
  fontWeight: FontWeight.w500,
  color: Colors.black87,
);
const blogMinuteStyle = TextStyle(
  decorationColor: Colors.black45,
//  fontSize: 11,
  fontWeight: FontWeight.w300,
  color: Colors.grey,
);
