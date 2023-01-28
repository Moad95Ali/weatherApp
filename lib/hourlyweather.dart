import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/model/fiveweather.dart';
import 'package:weather_app/style/textStyle.dart';
import 'package:weather_app/utils/times.dart';
import 'package:weather_app/model/weather.dart';

import 'api/api.dart';
import 'api/constans.dart';

class HourlyWather extends StatefulWidget {
  const HourlyWather({Key? key}) : super(key: key);

  @override
  State<HourlyWather> createState() => _HourlyWatherState();
}

class _HourlyWatherState extends State<HourlyWather> {
  var fetchNetworkCall = Api().getForestCast(forecastUrl, {
    'q': 'amman',
    'lang': 'eng',
    'mode': 'json',
    'appid': '2e5045c7038a055bebcd451b9fbc88f2',
    'units': 'metric'
  });
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ForestCast?>(
        future: fetchNetworkCall, // async work
        builder: (BuildContext context, AsyncSnapshot<ForestCast?> snapshot) {
          // if data still fethcing the resutl return loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // to show error if data return null
          print(snapshot.error);

          // get data
          ForestCast? data = snapshot.data;

          // bulid your ui
          return Container(
            margin: const EdgeInsets.all(15),
            height: 180,
            decoration: BoxDecoration(
                color: const Color(0x95272a48),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(
                        (Icons.access_time_outlined),
                        size: 18,
                        color: Colors.white24,
                      ),
                      Text(
                        'HOURLY FORECAST',
                        style: TextStyle(
                            color: Colors.white38,
                            fontFamily: 'Signika',
                            fontSize: 13,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 0.8,
                    color: Colors.white10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 114,
                      child: Center(
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: data?.list.length ?? 0,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 30),
                            itemBuilder: (context, index) => Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          DateUtil.fixDate(
                                              data?.list[index].dt ?? 0),
                                          style: StyleText.timeStyle,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(image(data
                                                      ?.list[index]
                                                      .weather
                                                      ?.first
                                                      .icon)))),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '20',
                                          style: StyleText.tempStyle,
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
