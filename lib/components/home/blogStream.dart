import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;


Widget blogStreamHome(BuildContext context) {

  fs.Firestore _firestore = firestore();

  Stream blogStream = _firestore.collection("collectionPath").get().asStream();


  return StreamBuilder<fs.QuerySnapshot>(
    stream: blogStream,
    builder: (BuildContext context, snapshot) {
      
      if(snapshot.hasError) return Text('Bir problem oluştu');

      if(snapshot.data==null) return CircularProgressIndicator();

      

      return ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
          return Container();
        },
      );


    },
  );
}
