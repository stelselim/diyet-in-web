import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase/firestore.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final DocumentSnapshot blogData;

  BlogCard({
    @required this.blogData,
  });

  Widget smallScreen(context) {
    String pictureURL = blogData.data()["Resim"];
    String characters =
        blogData.data()["BlogYazısı"] + blogData.data()["AnaDüşünce"];

    int characterNumber = characters.length;
    num timeToRead = (characterNumber / 150) / 6;
    timeToRead = timeToRead.round();

    return AspectRatio(
      aspectRatio: 1.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.19,
            padding: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(pictureURL),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            blogData.data()["Başlık"],
            softWrap: true,
            textAlign: TextAlign.center,
            style: blogTitleStyle,
          ),
          Text(
            "$timeToRead Dakika Okuma",
            textAlign: TextAlign.center,
            style: blogMinuteStyle,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return smallScreen(context);
  }
}

const blogTitleStyle = TextStyle(
  decorationColor: Colors.black54,
  fontSize: 13,
  fontWeight: FontWeight.w500,
  color: Colors.black87,
);
const blogMinuteStyle = TextStyle(
  decorationColor: Colors.black45,
  fontSize: 11,
  fontWeight: FontWeight.w300,
  color: Colors.grey,
);
