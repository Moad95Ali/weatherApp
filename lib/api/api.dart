import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/api/constans.dart';
import 'package:weather_app/model/weather.dart';

class Api {
  var client = http.Client();

// we add ? bcz we have null value will return, its called nullsaftey in flutter
  Future<WeatherResult?> get(
      String path, Map<String, dynamic> queryParameters) async {
    // prpare the full url
    var uri = Uri.https(baseUrl, path, queryParameters);

    // fetch data from api
    var response = await http.get(uri);

    // check response
    if (response.statusCode == 200) {
      // jsonDecode to convert json string to map to pass the map to fromJson
      // method in the WeatherResult
      return WeatherResult.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}


//https://api.openweathermap.org/data/2.5/weather?q=amman&lang=eng&mode=json&appid=2e5045c7038a055bebcd451b9fbc88f2

//https://api.openweathermap.org/data/2.5/forecast?q=amman&lang=eng&mode=json&appid=2e5045c7038a055bebcd451b9fbc88f2