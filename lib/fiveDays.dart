import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/style/textStyle.dart';

class FiveDays extends StatelessWidget {
  const FiveDays({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(45, 49, 84, 40),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(children: [
        Row(
          children: const [
            Icon(
              Icons.access_time_outlined,
              size: 18,
              color: Colors.white24,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'FIVE DAYS FORECAST',
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Days', style: StyleText.dayStyle),
            Icon(
              Icons.cloud,
              size: 30,
              color: Colors.white70,
            ),
            Text('2', style: StyleText.tempStyle),
            Text('10', style: StyleText.tempStyle)
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Days', style: StyleText.dayStyle),
            Icon(
              Icons.cloud,
              size: 30,
              color: Colors.white70,
            ),
            Text('2', style: StyleText.tempStyle),
            Text('10', style: StyleText.tempStyle)
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Days', style: StyleText.dayStyle),
            Icon(
              Icons.cloud,
              size: 30,
              color: Colors.white70,
            ),
            Text('2', style: StyleText.tempStyle),
            Text('10', style: StyleText.tempStyle)
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Days', style: StyleText.dayStyle),
            Icon(
              Icons.cloud,
              size: 30,
              color: Colors.white70,
            ),
            Text('2', style: StyleText.tempStyle),
            Text('10', style: StyleText.tempStyle)
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Days', style: StyleText.dayStyle),
            Icon(
              Icons.cloud,
              size: 30,
              color: Colors.white70,
            ),
            Text('2', style: StyleText.tempStyle),
            Text('10', style: StyleText.tempStyle)
          ],
        ),
        const Divider(
          thickness: 0.8,
          color: Colors.white10,
        ),
      ]),
    );
  }
}
