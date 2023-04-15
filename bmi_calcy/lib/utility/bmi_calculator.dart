import 'dart:math';

import 'package:flutter/material.dart';

class BmiCalculator {
  BmiCalculator({required this.height, required this.weight});

  double height;
  double weight;

  double _bmi = 0;

  String calculateBMI() {
    _bmi = this.weight / pow(this.height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  Color getResultColour() {
    if (_bmi >= 25) {
      return Colors.redAccent;
    } else if (_bmi > 18.5) {
      return Colors.greenAccent;
    } else {
      return Colors.orangeAccent;
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
