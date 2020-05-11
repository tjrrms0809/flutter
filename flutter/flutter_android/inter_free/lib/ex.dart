import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'INTER FREE',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.blue,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.brown,
          title: Text('INTER FREE'),
          actions: <Widget>[
            PopupMenuButton(itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text('관리자')),
                PopupMenuItem(child: Text('통역사')),
              ];
            })
          ],
        ),
        drawer: Drawer(
          child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('AAA'),
                  accountEmail: Text('bbb'),
                ),
              ]
          ),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 100,
                  color: Colors.white,
                  child: Text('Container 1'),
                ),
                Container(
                  height: 100,
                  color: Colors.blue,
                  child: Text(
                    'Find your event',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
