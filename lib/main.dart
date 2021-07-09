import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/books_page.dart';
import 'package:flutter_demo/pages/index_page.dart';
import 'package:flutter_demo/pages/randam_words_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      initialRoute: '/',
      routes: {
        '/': (context) => IndexPage(),
        '/words': (context) => RandomWordsPage(),
        '/books': (context) => BooksPage()
      },
      theme: ThemeData(primaryColor: Colors.white)
    );
  }
}