import 'package:diyetinweb/components/general/appBar.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key key}) : super(key: key);

  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  String cat = "SağlıklıYaşam";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    num childAspectRatio = 1;

    fs.Firestore instance = firestore();

    // if (width > 600 && width < 801) childAspectRatio = 1.5;
    // if (width > 800 && width < 1001) childAspectRatio = 2.15;
    // if (width > 1000) childAspectRatio = 3;
    // if (width > 1200) childAspectRatio = 3.7;

    return Scaffold(
      appBar: appBarWidget(title: "Diyet-in", context: context),
      body: Container(
        color: Colors.blueGrey.shade50,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              PopupMenuButton(
                child: Container(
                  width: 170,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade500,
                    border: Border.all(
                      width: 0.7,
                      color: Colors.green.shade700,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Text(
                      "Kategori Seçiniz",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                itemBuilder: (context) {
                  return [
                    /// Kilo Alma
                    PopupMenuItem(
                      child: ListTile(
                        trailing: Icon(FontAwesomeIcons.rocket),
                        title: Text("Kilo Alma"),
                        onTap: () async {
                          this.setState(() {
                            cat = "KiloAlma";
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ),

                    /// Kilo Verme
                    PopupMenuItem(
                      child: ListTile(
                        trailing: Icon(FontAwesomeIcons.weight),
                        title: Text("Kilo Verme"),
                        onTap: () {
                          setState(() {
                            cat = "KiloVerme";
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ),

                    // SağlıklıYaşam
                    PopupMenuItem(
                      child: ListTile(
                        trailing: Icon(Icons.accessibility_new),
                        title: Text("Sağlıklı Yaşam"),
                        onTap: () {
                          setState(() {
                            cat = "SağlıklıYaşam";
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    // Doğru Bilinen Yanlışlar
                    PopupMenuItem(
                      child: ListTile(
                        trailing: Icon(Icons.warning),
                        title: Text("Doğru Bilinen Yanlışlar"),
                        onTap: () {
                          setState(() {
                            cat = "DoğruBilinenYanlışlar";
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ),

                    // ŞaşırtanBilgiler
                    PopupMenuItem(
                      child: ListTile(
                        trailing: Icon(FontAwesomeIcons.surprise),
                        title: Text("Şaşırtan Bilgiler"),
                        onTap: () {
                          setState(() {
                            cat = "ŞaşırtanBilgiler";
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ];
                },
              ),
              Expanded(
                  child: FutureBuilder<fs.DocumentSnapshot>(
                future: instance
                    .collection("/BeslenmeApp/AllDatas/SSS")
                    .doc("$cat")
                    .get(),
                builder: (context, snap) {
                  if (snap.data == null)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  if (snap.hasError)
                    return Center(
                      child: Text("İnternet Problemi"),
                    );

                  final data = snap.data.data();
                  final List questions = data["Soru"];

                  return Container(
                    width: 800,
                    child: ListView.builder(
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: questions.length,
                      itemBuilder: (context, index) {
                        final Map question = questions[index];

                        return QuestionCard(
                          data: question,
                        );
                      },
                    ),
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key key, @required this.data}) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    final question = data["Başlık"];
    final answer = data["Cevap"];
    final source = data["Kaynak"];

    return Container(
      margin: EdgeInsets.all(6),
      //padding: EdgeInsets.symmetric(vertical:6),
      child: Card(
        child: ExpandablePanel(
          controller: ExpandableController(initialExpanded: true),
          header: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 25,
            ),
            child: Text(question),
          ),
          collapsed: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 15,
            ),
            child: Column(
              children: [
                Text(
                  answer,
                  style: TextStyle(color: Colors.blueGrey),
                   
                  //softWrap: true,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  source,
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w500),
                  //softWrap: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // return Card(
    //   child: Container(
    //       child: Column(
    //     children: [
    //       Text(
    //         "$question",
    //         style: TextStyle(
    //             fontWeight: FontWeight.w500, color: Colors.blueGrey.shade700),
    //       ),
    //       Text("$answer"),
    //       Text("$source"),
    //     ],
    //   )),
    // );
  }
}
