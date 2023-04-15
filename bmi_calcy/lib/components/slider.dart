import 'package:flutter/material.dart';

class SliderComponent extends StatelessWidget {
  SliderComponent({
    Key? key,
    required this.sliderval,
    required this.max,
    required this.title,
    required this.unit,
    required this.onChange,
  }) : super(key: key);
  double sliderval;
  double max;
  final String title;
  final String unit;
  void Function(double) onChange;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            '${sliderval.round()} ${unit}',
            style: Theme.of(context).textTheme.headline3,
          ),
          Slider(
            value: sliderval,
            max: max,
            divisions: max.toInt(),
            label: sliderval.round().toString(),
            onChanged: (double value) {
              onChange(value);
            },
          ),
        ],
      ),
    );
  }
}
