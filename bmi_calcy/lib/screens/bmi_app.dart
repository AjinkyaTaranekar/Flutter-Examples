import 'package:bmi_calcy/components/counter.dart';
import 'package:bmi_calcy/components/slider.dart';
import 'package:flutter/material.dart';

class BmiApp extends StatefulWidget {
  const BmiApp({Key? key}) : super(key: key);

  @override
  _BmiAppState createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {
  int _age = 0;
  int _weight = 0;
  double _height = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Counter(counter: _age, title: 'Age (in years)'),
              Counter(counter: _weight, title: 'Weight (in kgs)'),
            ],
          ),
          SliderComponent(
            sliderval: _height,
            title: 'Height (in cms)',
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('Calculate BMI'),
          ),
        ],
      )),
    );
  }
}
