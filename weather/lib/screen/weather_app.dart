import 'package:flutter/material.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/utility/open_weather_map.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String location = 'London';
  late Future<WeatherData> weatherData;

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  void _fetchWeatherData() async {
    print(location);
    weatherData = fetchWeatherData(location);
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
              SizedBox(
                height: 200,
                child: FutureBuilder<WeatherData>(
                  future: weatherData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return _buildWeatherData(snapshot.data!);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherData(WeatherData weatherData) {
    return Column(
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
    );
  }
}
