import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:weather_app/fiveDays.dart';
import 'package:weather_app/home_page.dart';
import 'package:weather_app/hourlyweather.dart';
import 'package:weather_app/satellite.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOption = <Widget>[
    const HomePage(),
    const Satellite(),
    Text('14 Days Forecast'),
  ];

  void onChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOption[_selectedIndex]),
      bottomNavigationBar: Container(
        color: Color(0xff0d1f3f),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            color: Color(0xFFB9B9B9),
            iconSize: 18,
            tabBackgroundColor: Color(0x76FFFFFF),
            tabBorderRadius: 10,






            padding: EdgeInsets.all(8),
            gap: 10,
            onTabChange: (value) {
              onChange(value);
            },
            tabs: [
              GButton(
                  icon: FontAwesomeIcons.home,
                  text: 'Home Weather' ,

              ),
              GButton(
                  icon: FontAwesomeIcons.satellite,
                  text: 'Satellite' ),
              GButton(
                  icon: FontAwesomeIcons.cloud,
                  text: '10 Days' ,
              ),
            ],




          ),
        ),
      ),
    );
  }
}
