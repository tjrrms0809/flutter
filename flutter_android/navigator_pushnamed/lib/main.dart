import 'package:flutter/material.dart';
import 'package:navigatorpushnamed/ScreenA.dart';
import 'package:navigatorpushnamed/ScreenB.dart';
import 'package:navigatorpushnamed/ScreenC.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' :(context) => ScreenA(),
        '/b' :(context) => ScreenB(),
        '/c' :(context) => ScreenC()
      },
    );
  }
}