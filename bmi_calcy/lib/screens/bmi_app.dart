import 'package:bmi_calcy/components/button.dart';
import 'package:bmi_calcy/components/slider.dart';
import 'package:bmi_calcy/screens/results.dart';
import 'package:bmi_calcy/utility/bmi_calculator.dart';
import 'package:flutter/material.dart';

class BmiApp extends StatefulWidget {
  const BmiApp({Key? key}) : super(key: key);

  @override
  _BmiAppState createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {
  double _weight = 0;
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Select your weight and height',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SliderComponent(
                      sliderval: _weight,
                      title: 'Weight (in kgs)',
                      max: 150,
                      unit: 'kgs',
                      onChange: (double value) {
                        setState(() {
                          _weight = value;
                        });
                      },
                    ),
                    SliderComponent(
                      sliderval: _height,
                      title: 'Height (in cms)',
                      max: 200,
                      unit: 'cms',
                      onChange: (double value) {
                        setState(() {
                          _height = value;
                        });
                      },
                    )
                  ],
                ),
              )),
          BottomButton(
            buttonTitle: 'Calculate BMI',
            onTap: () {
              BmiCalculator bmiCalculator =
                  BmiCalculator(height: _height, weight: _weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: bmiCalculator.calculateBMI(),
                    resultText: bmiCalculator.getResult(),
                    resultColour: bmiCalculator.getResultColour(),
                    interpretation: bmiCalculator.getInterpretation(),
                  ),
                ),
              );
            },
          )
        ],
      )),
    );
  }
}
