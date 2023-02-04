import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/api/api.dart';
import 'package:weather_app/api/constans.dart';
import 'package:weather_app/fiveDays.dart';

import 'package:weather_app/hourlyweather.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/satellite.dart';
import 'package:weather_app/style/textStyle.dart';
import 'package:weather_app/style/textStyle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/utils/number_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var fetchNetworkCall = Api().get(weatherUrl, {
    'q': 'amman',
    'lang': 'eng',
    'mode': 'json',
    'appid': '2e5045c7038a055bebcd451b9fbc88f2',
    'units': 'metric'
  });

  @override
  Widget build(BuildContext context) {
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
            body: snapshot.hasError
                ? Center(child: Text(snapshot.error.toString()))
                : Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/background.jpg'),
                          fit: BoxFit.cover),
                    ),
                    child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 90),
                      children: [
                        Column(
                          children: [
                            Text(
                              data?.name ?? "",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontFamily: 'Signika',
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              NumberUtil.fixNumber(data?.main?.temp),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontFamily: 'Signika',
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(
                                  iconImage(data?.weather?.first.icon),
                                ),
                              )),
                            ),
                            Text(
                              "${data?.weather?.first.description}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Signika',
                                  fontWeight: FontWeight.w100),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const HourlyWather(),
                        const FiveDays(),
                        const Satellite()
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
