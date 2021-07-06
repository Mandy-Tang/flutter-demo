import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/words_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Startup Name Generator', home: RandomWords(), theme: ThemeData(primaryColor: Colors.white),);
  }
}


