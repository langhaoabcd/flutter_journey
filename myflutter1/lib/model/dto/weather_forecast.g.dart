// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecast _$WeatherForecastFromJson(Map<String, dynamic> json) =>
    WeatherForecast(
      date: json['date'] as String,
      temperatureC: json['temperatureC'] as int,
      summary: json['summary'] as String,
      keyValuePairs: (json['keyValuePairs'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      temperatureF: json['temperatureF'] as int,
    );

Map<String, dynamic> _$WeatherForecastToJson(WeatherForecast instance) =>
    <String, dynamic>{
      'date': instance.date,
      'summary': instance.summary,
      'temperatureC': instance.temperatureC,
      'temperatureF': instance.temperatureF,
      'keyValuePairs': instance.keyValuePairs,
    };
