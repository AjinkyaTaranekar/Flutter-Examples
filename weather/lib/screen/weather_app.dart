import 'package:flutter/material.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/utility/open_weather_map.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String location = 'London';
  WeatherData weatherData = WeatherData(
    location: 'Loading...',
    temperature: 0,
    description: 'Loading...',
    iconCode: 'Loading...',
  );

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  void _fetchWeatherData() async {
    print(location);
    final weatherData = await fetchWeatherData(location);
    setState(() {
      this.weatherData = weatherData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (weatherData != null)
              Column(
                children: [
                  Text(
                    '${weatherData.location}',
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
                        'https://openweathermap.org/img/w/${weatherData.iconCode}.png',
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 16),
                      Text(
                        '${weatherData.temperature.round()}°C',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    '${weatherData.description}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            if (weatherData == null) CircularProgressIndicator(),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Enter location',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) {
                  setState(() {
                    location = value;
                  });
                  _fetchWeatherData();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
