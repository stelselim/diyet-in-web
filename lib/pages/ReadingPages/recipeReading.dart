import 'package:firebase/firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:diyetinweb/components/general/appBar.dart';

class RecipeReadingPage extends StatelessWidget {
  const RecipeReadingPage({
    Key key,
    this.data,
  }) : super(key: key);
  final DocumentSnapshot data;
  @override
  Widget build(BuildContext context) {
    final dataOfRecipeReading = data.data();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    dynamic makros = dataOfRecipeReading["Kalori"];
    String imageURL = dataOfRecipeReading["Resim"];

    final pic = dataOfRecipeReading["Resim"];
    final mainIdea = dataOfRecipeReading["Yapılışı"];
    final portion = dataOfRecipeReading["Porsiyon"];
    final header = dataOfRecipeReading["Tarifinİsmi"];
    final text = dataOfRecipeReading["İçindekiler"];
    final sources = dataOfRecipeReading["Kalori"];
    final cook = dataOfRecipeReading["YapanKişi"];

    final DateTime topText = dataOfRecipeReading["EklenmeTarihi"];
    final time = topText.day.toString() +
        '-' +
        topText.month.toString() +
        '-' +
        topText.year.toString();

    return Scaffold(
      appBar: appBarWidget(title: "Diyet-in", context: context),
      body: Container(
        color: Colors.blueGrey.shade100,
        child: Center(
          child: Container(
            width: 750,
            color: Colors.blueGrey.shade50,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                // Image
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                  child: Container(
                    height: width>400? height*0.54:height*0.34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      image: DecorationImage(
                        fit: BoxFit.cover,

                        // Tarif Reading Page
                        image: NetworkImage(imageURL),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),

                // Text and Contents
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "${dataOfRecipeReading["Tarifinİsmi"]}",
                        style: titleTextStyle,
                        textScaleFactor: 1.35,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          """Kalori:${makros["Kalori"]} cal
Karbonhidrat:${makros["Karbonhidrat"]} gr 
Protein:${makros["Protein"]} gr 
Yağ:${makros["Yağ"]} gr""",
                          style: explanationTextStyle,
                          textScaleFactor: 1.3,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${dataOfRecipeReading["İçindekiler"]}",
                          style: explanationTextStyle,
                          textScaleFactor: 1.2,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "\t${dataOfRecipeReading["Yapılışı"]}",
                        style: headingTitle,
                        textScaleFactor: 1.1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Text(
                        "${dataOfRecipeReading["YapanKişi"]}",
                        style: sourceTextStyle,
                      ),
                      SizedBox(
                        height: 5,
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

final titleTextStyle =
    TextStyle(fontWeight: FontWeight.w600, height: 1, color: Colors.blueGrey.shade800);

final explanationTextStyle =
    TextStyle(height: 1.5, fontWeight: FontWeight.w500, color: Colors.black87);

final headingTitle =
    TextStyle(height: 1.5, fontWeight: FontWeight.w500, color: Colors.black87);

final sourceTextStyle =
    TextStyle(height: 1.5, fontWeight: FontWeight.w700, color: Colors.black87);
