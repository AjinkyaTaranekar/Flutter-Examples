import 'package:flutter/material.dart';

class SliderComponent extends StatefulWidget {
  SliderComponent(
      {Key? key, required this.sliderval, required this.title})
      : super(key: key);
  double sliderval = 0;
  final String title;

  @override
  _SliderComponentState createState() => _SliderComponentState();
}

class _SliderComponentState extends State<SliderComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 10.0,
              offset: Offset(0, 10),
            ),
          ]),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              '${widget.sliderval}',
              style: Theme.of(context).textTheme.headline3,
            ),
            Slider(
              value: widget.sliderval,
              max: 250,
              divisions: 250,
              label: widget.sliderval.round().toString(),
              onChanged: (double value) {
                setState(() {
                  widget.sliderval = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
