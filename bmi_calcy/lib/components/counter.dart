import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  Counter({Key? key, required this.counter, required this.title})
      : super(key: key);
  int counter = 0;
  final String title;

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  void _incrementCounter() {
    setState(() {
      widget.counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (widget.counter > 0) {
        widget.counter--;
      }
    });
  }

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
              '${widget.counter}',
              style: Theme.of(context).textTheme.headline3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: _decrementCounter,
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 60.0),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
