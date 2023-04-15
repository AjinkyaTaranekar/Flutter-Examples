class WeatherData {
  final String location;
  final double temperature;
  final String description;
  final String iconCode;

  WeatherData(
      {required this.location,
      this.temperature = 0,
      this.description = '',
      this.iconCode = ''});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      location: json['name'],
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      iconCode: json['weather'][0]['icon'],
    );
  }
}
