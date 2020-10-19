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

    final width = MediaQuery.of(context).size.width;

    String header = blogData.data()['Başlık'];
    if (header.length > 19) {
      header = header.substring(0, 18) + '...';
    }
    String characters =
        blogData.data()["BlogYazısı"] + blogData.data()["AnaDüşünce"];

    int characterNumber = characters.length;
    num timeToRead = (characterNumber / 150) / 6;
    timeToRead = timeToRead.round();

    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: AspectRatio(
                aspectRatio: 3,
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
                      textScaleFactor: 1.1,
                    ),
                    Text(
                      "$timeToRead Dakika Okuma",
                      style: blogMinuteStyle,
                      textScaleFactor: 0.9
                    ),
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
    return smallScreen(context);
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
