import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  CounterApp({Key? key}) : super(key: key);

  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;
  int _min = 0;
  int _max = 10;
  String message = "";

  void _incrementCounter() {
    if (_counter < _max) {
      setState(() {
        _counter++;
        message = "";
      });
    } else {
      setState(() {
        message = "Max limit reached";
      });
    }
  }

  void _decrementCounter() {
    if (_counter > _min) {
      setState(() {
        _counter--;
        message = "";
      });
    } else {
      setState(() {
        message = "Min limit reached";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: _decrementCounter,
                    tooltip: 'Decrement',
                    child: Icon(Icons.remove),
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  FloatingActionButton(
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              message,
              style: Theme.of(context).textTheme.headline6,
            )
          ],
        ),
      ),
    );
  }
}
