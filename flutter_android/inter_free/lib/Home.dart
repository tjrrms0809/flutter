import 'package:flutter/material.dart';
import 'Home2.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();

  String code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown,
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "INTER FREE",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
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
          child: ListView(children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('AAA'),
              accountEmail: Text('bbb'),
            ),
          ]),
        ),
        body: Column(
          children: <Widget>[
            Image(image: AssetImage('assets/num01.png'),),
            SizedBox(
              height: 10.0,
            ),
            buildFindyoureventText(),
            SizedBox(
              height: 10.0,
            ),
            Builder(
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Form(
                            child: Theme(
                                data: ThemeData(
                                  primaryColor: Colors.brown,
                                  inputDecorationTheme: InputDecorationTheme(
                                    labelStyle: TextStyle(
                                        color: Colors.brown, fontSize: 15.0),
                                  ),
                                ),
                                child: Container(
                                  padding:
                                      EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 40.0,
                                      ),
                                      TextFormField(
                                        controller: controller,
                                        decoration: InputDecoration(
                                          labelText: 'Event Code',
                                          border: UnderlineInputBorder(),
                                          filled: true,
                                          icon: Icon(Icons.search),
                                          hintText: 'Event Code',
//                                          prefixText: '1234',
                                        ),
                                        keyboardType: TextInputType.number,
                                        onSaved: (String value){
                                          this.code = value;  //코드 값
                                        },
                                      ),
                                      SizedBox(
                                        height: 40.0,
                                      ),
                                      ButtonTheme(
                                          minWidth: 120.0,
                                          height: 60.0,
                                          child: RaisedButton(
                                              color: Colors.red,
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: Colors.white,
                                                size: 40.0,
                                              ),
                                              onPressed: () {
                                                if (controller.text == '1234' ||
                                                    controller.text == 'code') {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              Home2()));
                                                } else {
                                                  showSnackBar(context);
                                                }
                                              })),
                                      SizedBox(height: 40.0,),
                                      Image(image: AssetImage('assets/num02.png'))
                                    ],
                                  ),
                                )))
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }

  Text buildFindyoureventText() {
    return (Text(
      "Find your event",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 25.0,
      ),
    ));
  }
}

void showSnackBar(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(
      '코드의 정보를 다시 확인하세요',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}
