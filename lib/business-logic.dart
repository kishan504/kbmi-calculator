import 'dart:math';

class Calculate {
  final int height;
  final int weight;
  double _bmi;

  Calculate({this.height, this.weight});

  String getResultPercentage() {
   _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
     if (_bmi >= 25) {
         return 'Over Weight';
     }
     else if (_bmi > 18.5) {
       return 'Normal';
     }
     else {
       return 'UnderWeight';
     }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more !.';
    }
    else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job !';
    }
    else {
      return 'You have a lower than normal body weight. Eat more !.';
    }
  }

}