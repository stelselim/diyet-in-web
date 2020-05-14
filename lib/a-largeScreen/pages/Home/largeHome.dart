import 'package:diyetinweb/backend/Streams/quoteFuture.dart';
import 'package:diyetinweb/backend/Streams/recipeStream.dart';
import 'package:diyetinweb/components/general/appBar.dart';
import 'package:diyetinweb/components/home/blogCard.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:flutter/material.dart';

class LargeHome extends StatelessWidget {
  const LargeHome({Key key}) : super(key: key);
 


  @override
  Widget build(BuildContext context) {
    final Stream blogStream = firestore().collection("/BeslenmeApp/AllDatas/Blog").limit(10).get().asStream();
    
 
   return Scaffold(
      appBar: appBarWidget(title: "Diyet-in", context: context),
 
    );
 }

  
}
