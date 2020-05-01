import 'package:diyetinweb/components/general/appBar.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    fs.Firestore _firestore = firestore();

    return Scaffold(
      appBar: appBarWidget(title: "Diyet-in", context: context),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: StreamBuilder<fs.QuerySnapshot>(
              stream: firestore()
                  .collection("/FromUsers/Answered/AnsweredQuestions")
                  .get()
                  .asStream(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Problem");
                }
                if (snapshot.data == null)
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    final item = snapshot.data.docs.elementAt(index).data();
                    return Card(
                      margin: EdgeInsets.all(20),
                      child: Text('${item["Cevap"]}'),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
