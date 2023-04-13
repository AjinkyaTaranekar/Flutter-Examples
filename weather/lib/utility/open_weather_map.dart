import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/model/weather.dart';

Future<WeatherData> fetchWeatherData(String location) async {
  final apiKey = 'a896b6b72647c0a2f11d210357973519';
  final url =
      'https://api.openweathermap.org/data/2.5/weather?q=$location&units=metric&appid=$apiKey';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return WeatherData.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load weather data');
  }
}
