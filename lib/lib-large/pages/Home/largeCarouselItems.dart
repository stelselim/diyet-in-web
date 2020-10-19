import 'package:diyetinweb/components/general/socialMediaBar.dart';
import 'package:diyetinweb/utilities/urlLaunchers.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarouselOne extends StatelessWidget {
  const CarouselOne({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        boxShadow: [
          // BoxShadow(
          //   offset: Offset(10,50),
          //   color: Colors.black38
          // ),
          // BoxShadow(
          //   offset: Offset(5,20),
          //   color: Colors.black38
          // ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Diyet-in",
                  textScaleFactor:
                      MediaQuery.of(context).size.width > 1000 ? 4.5 : 3.5,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.blueGrey.shade600,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Opacity(
                  opacity: 0.8,
                  child: Text(
                    "Yeni Neslin Güvenilir Uygulaması",
                    textAlign: TextAlign.left,
                    textScaleFactor:
                        MediaQuery.of(context).size.width > 1000 ? 3 : 2.5,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.blueGrey.shade300,
                    ),
                  ),
                ),
                socialMediaBar()
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset("assets/homeCarousel/3.jpeg"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselTwo extends StatelessWidget {
  const CarouselTwo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contentTextStyle = TextStyle(
      color: Colors.grey.shade600,
      fontWeight: FontWeight.w400,
    );
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Çok Özel İçeriklerimiz",
              textScaleFactor: 2.5,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.blueGrey.shade600,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/Blog"),
                    child: Column(
                      children: [
                        Text(
                          "Blog Yazıları",
                          textScaleFactor: 1.5,
                          textAlign: TextAlign.left,
                          style: contentTextStyle,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Image.asset(
                          "assets/homeCarousel/Blog.png",
                          height: 250,
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/Recipe"),
                    child: Column(
                      children: [
                        Text(
                          "Çok Özel Tarifler",
                          textScaleFactor: 1.5,
                          textAlign: TextAlign.left,
                          style: contentTextStyle,
                        ),
                        Expanded(
                          child: Image.asset(
                            "assets/homeCarousel/Tarif.png",
                            height: 270,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(5),
                    onPressed: () => Navigator.pushNamed(context, "/FAQ"),
                    child: Column(
                      children: [
                        Text(
                          "Sıkça Sorulan Sorular",
                          textScaleFactor: 1.5,
                          textAlign: TextAlign.left,
                          style: contentTextStyle,
                        ),
                        Image.asset(
                          "assets/homeCarousel/SSS.png",
                          height: 250,
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CarouselThree extends StatelessWidget {
  const CarouselThree({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int day = DateTime.now().day;
    int month = DateTime.now().month;
    int year = DateTime.now().year;

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              "Günün Sözü",
              textScaleFactor: 3.5,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          FutureBuilder<DocumentSnapshot>(
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
              int index =
                  DateTime.now().day % snapshot.data.data()["sözler"].length;
              // Günün Sözü Kartı yazılıp eklencek.
              return Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 25,
                  ),
                  child: Opacity(
                    opacity: 0.9,
                    child: Text(
                      quote[index],
                      textScaleFactor: 2.5,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 350),
            child: Text(
              "$day - $month - $year",
              textScaleFactor: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget socialMediaBarHome() {
  return Row(
    children: <Widget>[
      IconButton(
        icon: Icon(FontAwesomeIcons.instagram),
        onPressed: () => launchInstagram(),
      ),
      IconButton(
        icon: Icon(FontAwesomeIcons.twitter),
        onPressed: () => launchTwitter(),
      ),
      IconButton(
        icon: Icon(FontAwesomeIcons.facebook),
        onPressed: () => launchFacebook(),
      ),
      IconButton(
          icon: Icon(FontAwesomeIcons.appStore, size: 20),
          onPressed: () => launchAppleStore()),
      IconButton(
        icon: Icon(FontAwesomeIcons.googlePlay, size: 20),
        onPressed: () => launchGooglePlay(),
      ),
    ],
  );
}
