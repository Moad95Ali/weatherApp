import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/api/api.dart';
import 'package:weather_app/api/constans.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/style/textStyle.dart';
import 'package:weather_app/style/textStyle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

            body:  snapshot.hasError?
            Center(child: Text(snapshot.error.toString()))
            :Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/background.jpg'),
                  fit: BoxFit.cover
                ),
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
                        "${data?.main?.temp}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontFamily: 'Signika',
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
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
                  Container(
                    margin: const EdgeInsets.all(15),
                    height: 180,
                    decoration: BoxDecoration(
                        color: const Color(0x95272a48),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
                              height: 94,
                              child: Center(
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 24,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(width: 40),
                                    itemBuilder: (context, index) => Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  'Time',
                                                  style: StyleText.timeStyle,
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                const Icon(
                                                  FontAwesomeIcons
                                                      .cloudShowersHeavy,
                                                  color: Colors.white,
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
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 15, left: 15),
                    height: 300,
                    decoration: BoxDecoration(
                        color: const Color(0x95272a48),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(
                                (Icons.calendar_month_outlined),
                                size: 18,
                                color: Colors.white24,
                              ),
                              Text(
                                '5-DAYS FORECAST',
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
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Days',
                                    style: StyleText.dayStyle,
                                  ),
                                  const Icon(
                                    FontAwesomeIcons.cloudSun,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  Text(
                                    '-1',
                                    style: StyleText.dayStyle,
                                  ),
                                  Text(
                                    '6  ',
                                    style: StyleText.dayStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 0.8,
                            color: Colors.white10,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Days',
                                    style: StyleText.dayStyle,
                                  ),
                                  const Icon(
                                    FontAwesomeIcons.cloudSun,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  Text(
                                    '2',
                                    style: StyleText.dayStyle,
                                  ),
                                  Text(
                                    '8  ',
                                    style: StyleText.dayStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 0.8,
                            color: Colors.white10,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Days',
                                    style: StyleText.dayStyle,
                                  ),
                                  const Icon(
                                    FontAwesomeIcons.cloudSun,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  Text(
                                    '6',
                                    style: StyleText.dayStyle,
                                  ),
                                  Text(
                                    '11',
                                    style: StyleText.dayStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 0.8,
                            color: Colors.white10,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Days',
                                    style: StyleText.dayStyle,
                                  ),
                                  const Icon(
                                    FontAwesomeIcons.cloudSun,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  Text(
                                    '3',
                                    style: StyleText.dayStyle,
                                  ),
                                  Text(
                                    '13',
                                    style: StyleText.dayStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 0.8,
                            color: Colors.white10,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Days',
                                    style: StyleText.dayStyle,
                                  ),
                                  const SizedBox(
                                    width: 70,
                                  ),
                                  const Icon(
                                    FontAwesomeIcons.cloudSun,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  const SizedBox(
                                    width: 70,
                                  ),
                                  Text(
                                    '1',
                                    style: StyleText.dayStyle,
                                  ),
                                  const SizedBox(
                                    width: 70,
                                  ),
                                  Text(
                                    '12',
                                    style: StyleText.dayStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Divider(
                            thickness: 0.8,
                            color: Colors.white10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                'OpenWeather.org',
                                style: TextStyle(color: Colors.white54),
                              ),
                              Text(
                                'CopyRight',
                                style: TextStyle(color: Colors.white54),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
