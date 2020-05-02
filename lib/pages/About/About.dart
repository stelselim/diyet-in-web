import 'package:diyetinweb/components/general/appBar.dart';
// import 'package:firebase/firebase.dart';
// import 'package:firebase/firestore.dart' as fs;
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(title: "Diyet-in", context: context),
      body: ListView(
        physics: ScrollPhysics(),
        children: <Widget>[
          /// Blog Yazıları
         Text('Hakkımızda KISMI'),
        ],
      ),
    );
  }
}
