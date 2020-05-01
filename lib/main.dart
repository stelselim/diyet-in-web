import 'package:diyetinweb/pages/Home/home.dart';
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
