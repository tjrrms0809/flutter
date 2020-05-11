import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'HomeA.dart';

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('동시통역화면'),
      ),
      body: Column(
        children: <Widget>[
          Image(image: AssetImage('assets/num01.png'),),
          SizedBox(height: 10.0,),
          Row(children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 55)),
            ButtonTheme(
              minWidth: 30.0,
              height: 40.0,
              child: RaisedButton(
                  child: Text("A"),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeA()));
                  }),
            ),
            SizedBox(width: 15.0,),
            ButtonTheme(
              minWidth: 30.0,
              height: 40.0,
              child: RaisedButton(
                  child: Text("B"),
                  color: Colors.white,
                  onPressed: () {
                    showToast("Left dice: , Right dice: ");
                  }),
            ),
            SizedBox(width: 15.0,),
            ButtonTheme(
              minWidth: 30.0,
              height: 40.0,
              child: RaisedButton(
                  child: Text("C"),
                  color: Colors.white,
                  onPressed: () {
                    showToast("Left dice: , Right dice: ");
                  }),
            ),
            SizedBox(width: 15.0,),
            ButtonTheme(
              minWidth: 30.0,
              height: 40.0,
              child: RaisedButton(
                  child: Text("D"),
                  color: Colors.white,
                  onPressed: () {
                    showToast("Left dice: , Right dice: ");
                  }),
            ),
            SizedBox(width: 15.0,),
            ButtonTheme(
              minWidth: 30.0,
              height: 40.0,
              child: RaisedButton(
                  child: Text("E"),
                  color: Colors.white,
                  onPressed: () {
                    showToast("Left dice: , Right dice: ");
                  }),
            ),
          ]),
          SizedBox(height: 10.0,),
          Row(children: <Widget>[
            Image(image: AssetImage('assets/num01.png'),width: 100.0,height: 100.0,),
/////////////////////////////////
            /////////////////////////////////

          ],)
        ],
      ),
    );
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
  );
}
