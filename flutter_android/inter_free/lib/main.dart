import 'package:flutter/material.dart';
import 'Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "INTER FREE",
      theme: ThemeData(primarySwatch: Colors.red, primaryColor: Colors.brown),
      home: Home(),
    );
  }
}
