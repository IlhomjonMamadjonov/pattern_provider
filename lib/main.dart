import 'package:flutter/material.dart';
import 'package:pattern_setstate/pages/create_page.dart';
import 'package:pattern_setstate/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patterns Provider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        HomePage.id: (context) =>HomePage(),
        CreatePage.id: (context) =>CreatePage(),
      },
    );
  }
}
