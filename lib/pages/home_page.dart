import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: HomeNavigation()
    );
  }
}

class HomeNavigation extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scrollbar(child: ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        ListTile(
          title: Text('books page'),
          onTap: () => Navigator.pushNamed(context, '/books'),
        ),
        ListTile(
          title: Text('random words page'),
          onTap: () => Navigator.pushNamed(context, '/words')
        )
      ],
    ));
  }
}