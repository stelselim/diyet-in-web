import 'package:diyetinweb/pages/About/About.dart';
import 'package:diyetinweb/pages/Blog/Blog.dart';
import 'package:diyetinweb/pages/FAQ/FAQ.dart';
import 'package:diyetinweb/pages/Home/home.dart';
import 'package:diyetinweb/pages/Recipe/Recipe.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.green,
      primaryColor: Colors.lightGreen,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => App(),
      '/Blog': (context) => Blog(),
      '/Recipe': (context) => Recipe(),
      '/FAQ': (context) => FAQ(),
      '/About':(context)=>About(),
    },
  ));
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
