import 'package:flutter/material.dart';

import 'main_input.dart';

class ResultScreen extends StatelessWidget {
  final String result;
  final String resultPercentage;
  final String interpretation;


  ResultScreen({this.result, this.resultPercentage, this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 30, 0, 15),
            width: double.infinity,
            child: Text(
              "Your Result",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff000051),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            this.result,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold,color: Colors.lightGreen),
                          ),
                          Text(
                            this.resultPercentage,
                            style: TextStyle(
                                fontSize: 100, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Text(this.interpretation,
                                style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  InputPage()));
            },
            child: Container(
              width: double.infinity,
              height: 60,
              color: Colors.pink,
              child: Center(
                child: Text(
                  'Re-Calculate',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
