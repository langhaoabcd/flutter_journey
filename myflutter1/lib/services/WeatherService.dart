import 'package:myfltter1/dto/WeatherForecast.dart';

import '../utils/net/http.dart';

class WeatherService {
  static Future<List<WeatherForecast>> list() async {
    var res = await HttpHelper.get('/weatherforecast', params: null);
    List<WeatherForecast> result = [];
    res.forEach((element) {
      final map = element.cast<String, dynamic>();
      var wf = WeatherForecast.fromJson(map);
      result.add(wf);
    });
    return result;
  }
}
