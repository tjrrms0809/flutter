import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Nice game'),
        ),
        backgroundColor: Colors.blue,
        body: Text('hihi'),
      ),
    );
  }
}
