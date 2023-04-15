import 'package:flutter/material.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/utility/open_weather_map.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String _location = 'Indore';
  late Future<WeatherData> weatherData;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  void _fetchWeatherData() async {
    print(_location);
    weatherData = fetchWeatherData(_location);
    weatherData.then((value) {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your location',
                    border: OutlineInputBorder(),
                  ),
                  onSubmitted: (value) async {
                    setState(() {
                      _location = value;
                      _visible = false;
                    });
                    _fetchWeatherData();
                  },
                ),
              ),
              SizedBox(
                height: 200,
                child: FutureBuilder<WeatherData>(
                  future: weatherData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return _loadingWidget();
                    }
                    if (snapshot.hasData) {
                      return _buildWeatherData(snapshot.data!);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return _loadingWidget();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _loadingWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Loading',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 16),
        CircularProgressIndicator(),
      ],
    );
  }

  Widget _buildWeatherData(WeatherData weatherData) {
    return AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: const Duration(seconds: 1),
        child: Column(
          children: [
            Text(
              '${weatherData.name}',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://openweathermap.org/img/w/${weatherData.weather![0].icon}.png',
                  width: 50,
                  height: 50,
                ),
                SizedBox(width: 16),
                Text(
                  '${weatherData.main?.temp?.round()}°C',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              '${weatherData.weather![0].main}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}
