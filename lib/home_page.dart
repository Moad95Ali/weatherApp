import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/api/api.dart';
import 'package:weather_app/api/constans.dart';
import 'package:weather_app/model/weather.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var fetchNetworkCall = Api().get(weatherUrl, {
      'q': 'amman',
      'lang': 'eng',
      'mode': 'json',
      'appid': '2e5045c7038a055bebcd451b9fbc88f2',
      'units': 'metric'
    });

    return Scaffold(
      body: FutureBuilder<WeatherResult?>(
        future: fetchNetworkCall, // async work
        builder:
            (BuildContext context, AsyncSnapshot<WeatherResult?> snapshot) {
          // if data still fethcing the resutl return loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // to show error if data return null
          print(snapshot.error);

          // get data
          WeatherResult? data = snapshot.data;

          // bulid your ui
          return Scaffold(
            body: Container(
              child: Center(child: Text(data?.id.toString() ?? "")),
            ),
          );
        },
      ),
    );
  }
}
