import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Dice App',
            style: TextStyle(fontFamily: "PatrickHand", fontSize: 30.0),
          ),
          centerTitle: true,
          // backgroundColor: Colors.black,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftNumber = 1;

  int rightNumber = 1;

  Widget seti(int num) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          setState(() {
            leftNumber = Random().nextInt(6) + 1;
            rightNumber = Random().nextInt(6) + 1;
          });
        },
        child: Image.asset("images/dice$num.png"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context).size;
    var total = leftNumber + rightNumber;
    return SafeArea(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                height: data.height / 9,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Container(
                  child: Text(
                    "Left : $leftNumber",
                    style: TextStyle(
                      fontFamily: "Catamaran",
                      fontSize: 22.0,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: data.width / 26,
              ),
              Container(
                child: Text(
                  "+",
                  style: TextStyle(
                    fontFamily: "Catamaran",
                    fontSize: 25.5,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: data.width / 9,
              ),
              Container(
                child: Text(
                  "Right : $rightNumber",
                  style: TextStyle(
                    fontFamily: "Catamaran",
                    fontSize: 22.0,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: data.width / 9,
              ),
              Container(
                child: Text(
                  "=",
                  style: TextStyle(
                    fontFamily: "Catamaran",
                    fontSize: 22.0,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: data.width / 12,
              ),
              Container(
                child: Text(
                  "$total",
                  style: TextStyle(
                    fontFamily: "Catamaran",
                    fontSize: 29.0,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: data.height / 4.8,
          ),
          Center(
            child: Row(
              children: <Widget>[
                seti(leftNumber),
                seti(rightNumber),
              ],
            ),
          )
        ],
      ),
    );
  }
}
