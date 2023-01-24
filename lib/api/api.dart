import 'package:http/http.dart' as http;

class Api {
  var client = http.Client();

  Future<dynamic> get(String url, Map<String, dynamic> queryParameters) async {
    // prpare the full url
    print(url);
    var uri = Uri.https(url, '', queryParameters);

    print(uri);
    // fetch data from api
    var response = await http.get(uri);

    // check response
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }
}


//https://api.openweathermap.org/data/2.5/weather?q=amman&lang=eng&mode=json&appid=2e5045c7038a055bebcd451b9fbc88f2

//https://api.openweathermap.org/data/2.5/forecast?q=amman&lang=eng&mode=json&appid=2e5045c7038a055bebcd451b9fbc88f2