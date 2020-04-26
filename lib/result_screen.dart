import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
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
                        children: <Widget>[
                          Text(
                            'Over Weight',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold,color: Colors.lightGreen),
                          ),
                          Text(
                            '26.7',
                            style: TextStyle(
                                fontSize: 100, fontWeight: FontWeight.bold),
                          ),
                          Text('Hey whsssss up !',
                              style: TextStyle(fontSize: 22))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            color: Colors.pink,
            child: Center(
              child: Text(
                'Re-Calculate',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
            ),
          )
        ],
      ),
    );
  }
}
