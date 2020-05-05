import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text("Fast Math",
            style: TextStyle(
               fontSize: 40,
               color: Colors.redAccent,
            ),),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> myicons = [];
  int num=0;
  @override
  Widget build(BuildContext context) {
    List<int> ran = [
      Random().nextInt(1000),
      Random().nextInt(1000),
      Random().nextInt(100),
    ];

    if (ran[2] % 2 == 0) {
      ran.add(ran[0] + ran[1]);
      ran.add(Random().nextInt(1000) + 500);
    } else {
      ran.add(Random().nextInt(1000) + 500);
      ran.add(ran[0] + ran[1]);
    }
    return SafeArea(

      child: (myicons.length < 17) ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Container(
                        width: double.infinity,
                        child: Card(
                          color: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 150,
                              horizontal: 15,
                            ),
                            child: Text(
                              '${ran[1]} + ${ran[0]}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 50.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      textColor: Colors.white,
                      color: Colors.pink,
                      child: Text(
                        '${ran[4]}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                      onPressed: () {
                        if ((ran[1] + ran[0]) == ran[4]) {
                          setState(() {
                            num++;
                            myicons.add(
                              Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                            );
                          });
                        } else {
                          setState(() {
                            myicons.add(
                              Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            );
                          });
                        } //The user picked true.
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      color: Colors.orange,
                      child: Text(
                        '${ran[3]}',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        if ((ran[1] + ran[0]) == ran[3]) {
                          setState(() {
                            num++;
                            myicons.add(
                              Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                            );
                          });
                        } else {
                          setState(() {
                            myicons.add(
                              Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            );
                          });
                        }
                        //The user picked false.
                      },
                    ),
                  ),
                ),
                Row(
                  children: myicons,
                )
              ],
            )
          : Center(
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                color: Colors.orange,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 18,),
                  child: Text(
                    '   Game Over! You Scored ~$num',
                    style: TextStyle(
                      fontSize: 45.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: (){
                  num=0;
                  setState(() {
                    myicons.clear();
                  });
                },
              ),
            ),
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
