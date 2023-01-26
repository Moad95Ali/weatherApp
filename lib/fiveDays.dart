import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/api/constans.dart';
import 'package:weather_app/style/textStyle.dart';

import 'api/api.dart';
import 'model/fiveweather.dart';

class FiveDays extends StatefulWidget {
  const FiveDays({Key? key}) : super(key: key);

  @override
  State<FiveDays> createState() => _FiveDaysState();
}

class _FiveDaysState extends State<FiveDays> {
  // var fetchNetworkCall = Api().get(forecastUrl, {
  //   'q': 'amman',
  //   'lang': 'eng',
  //   'mode': 'json',
  //   'appid': '2e5045c7038a055bebcd451b9fbc88f2',
  //   'units': 'metric'
  // });
  @override
  Widget build(BuildContext context) {


    // return Scaffold(
    //     body: FutureBuilder<Fiveweather?>(
    //     future: fetchNetworkCall, // async work
    //     builder:
    //     (BuildContext context, AsyncSnapshot<Fiveweather?> snapshot) {
    //   // if data still fethcing the resutl return loading
    //   if (snapshot.connectionState == ConnectionState.waiting) {
    //     return const Center(child: CircularProgressIndicator());
    //   }
    //
    //   // to show error if data return null
    //   print(snapshot.error);
    //
    //   // get data
    //   Fiveweather? data = snapshot.data;

      // bulid your ui
    return  Container(
      margin: const EdgeInsets.only(right: 15, left: 15),
      height: 333,
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
                SizedBox(
                  width: 5,
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
                    Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/weather4.png'),
                          )),
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
                    Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/weather4.png'),
                          )),
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
                    Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/weather4.png'),
                          )),
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
                    Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/weather4.png'),
                          )),
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
                    Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/weather4.png'),
                          )),
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
                  style: TextStyle(color: Colors.white24),
                ),
                Text(
                  'CopyRight \u00a9',
                  style: TextStyle(color: Colors.white24),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
