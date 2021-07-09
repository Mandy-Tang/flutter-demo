import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: Text('words page 1'),
          onTap: () => Navigator.pushNamed(context, '/words'),
        ),
        ListTile(
          title: Text('words page 2'),
          onTap: () => Navigator.pushNamed(context, '/words')
        )
      ],
    ));
  }
}