import 'package:weather_app/model/weather.dart';

class ForestCast {
  List<WeatherResult> list = [];

  ForestCast(this.list);

  ForestCast.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list.add(WeatherResult.fromJson(v));
      });
    }
  }
}
