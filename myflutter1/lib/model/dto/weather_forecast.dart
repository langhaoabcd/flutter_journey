import 'package:json_annotation/json_annotation.dart';

part 'weather_forecast.g.dart';

@JsonSerializable()
class WeatherForecast {
  final String date;
  final String summary;
  final int temperatureC;
  final int temperatureF;
  Map<String, Object>? keyValuePairs;

  WeatherForecast(
      {required this.date,
      required this.temperatureC,
      required this.summary,
      this.keyValuePairs,
      required this.temperatureF});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastToJson(this);
}
