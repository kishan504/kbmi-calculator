import 'result_screen.dart';
import 'package:flutter/material.dart';
import 'main_input.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0A0E21),
        accentColor: Colors.purple,
      ),
      home: InputPage(),
      routes: {
        '0': (context) => InputPage(),
        '1': (context) => ResultScreen()
      },
    );
  }
}
