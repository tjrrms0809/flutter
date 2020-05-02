import 'package:flutter/material.dart';


class ScreenA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenA'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                color: Colors.red,
                child: Text('Go to screenB'),
                onPressed: () {
                  Navigator.pushNamed(context, '/b');
                }),
            RaisedButton(
                color: Colors.red,
                child: Text('Go to screenC'),
                onPressed: () {
                  Navigator.pushNamed(context, '/c');
                })
          ],
        ),
      ),
    );
  }
}
