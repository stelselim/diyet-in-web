import 'package:firebase/firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:diyetinweb/components/general/appBar.dart';

class BlogReadingPage extends StatelessWidget {
  const BlogReadingPage({
    Key key,
    this.data,
  }) : super(key: key);
  final DocumentSnapshot data;
  @override
  Widget build(BuildContext context) {
    final _dataBlogReading = data.data();
    final mainIdea = _dataBlogReading["AnaDüşünce"];
    final header = _dataBlogReading["Başlık"];
    final text = _dataBlogReading["BlogYazısı"];
    final sources = _dataBlogReading["Kaynaklar"];
    final author = _dataBlogReading["Yazar"];
    final DateTime topText = _dataBlogReading["EklenmeTarihi"];
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
            color: Colors.blueGrey.shade50,
            width: 750,
            child: Center(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),

                  // Tüm içerik
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: Column(
                        children: <Widget>[
                          //Üst Yazı
                          ListTile(
                            subtitle: Text(
                              "$time",
                              textAlign: TextAlign.right,
                            ),

                            // Başlık
                            title: Text(
                              "$header",
                              textAlign: TextAlign.center,
                              textScaleFactor: 1.1,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          // Başlık

                          Text(
                            "\t$mainIdea",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                            textScaleFactor: 1.2,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // İçerik Yazısı ve Kaynaklar son satırda ayrıca
                          Text(
                            "$text",
                            style: TextStyle(
                              height: 1.5,
                            ),
                            textScaleFactor: 1.1,
                          ),

                          // Yazar
                          Text(
                            "$author",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              height: 1.5,
                            ),
                            textScaleFactor: 1.1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "$sources",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                height: 1.5),
                            textScaleFactor: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
