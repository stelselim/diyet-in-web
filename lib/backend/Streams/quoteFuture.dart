import 'package:firebase/firebase.dart';

Future quoteOfDay =
    firestore().collection("/BeslenmeApp/AllDatas/GününSözü").doc("doc").get();
