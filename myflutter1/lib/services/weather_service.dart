import 'package:flutter/material.dart';

import '../model/dto/weather_forecast.dart';

import '../utils/net/http.dart';

class WeatherService {
  static Future<List<WeatherForecast>> list() async {
    var res = await HttpHelper.get('/weatherforecast', params: null);
    var result = res
        .map<WeatherForecast>((map) => WeatherForecast.fromJson(map))
        .toList();
    return result;

    //List<WeatherForecast> result = [];
    // res.forEach((elem ent) {
    //   // final map = element.cast<String, dynamic>();
    //   var wf = WeatherForecast.fromJson(element);
    //   result.add(wf);
    // });
    // return result;
  }
}
