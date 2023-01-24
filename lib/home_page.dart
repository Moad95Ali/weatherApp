import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/api/api.dart';
import 'package:weather_app/api/constans.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
          onTap: () {
            Api().get(weatherUrl, {
              'q': 'amman',
              'lang': 'eng',
              'mode': 'json',
              'appid': '2e5045c7038a055bebcd451b9fbc88f2',
              'units': 'metric'
            });
          },
          child: const Center(
            child: Text("Get"),
          )),
    );
  }
}
