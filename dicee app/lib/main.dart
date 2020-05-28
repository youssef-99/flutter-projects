import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
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
  @override

  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void roll (){
    leftDiceNumber = Random().nextInt(6)+1;
    rightDiceNumber = Random().nextInt(6)+1;
  }
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: (
                    ){
                  setState(() {
                    roll ();
                      });
                },
                child: Image.asset('images/dice$leftDiceNumber.png'
                ),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: (){
                  setState(() {
                    roll ();
                  });
                },
                child: Image.asset('images/dice$rightDiceNumber.png'
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
