import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Satellite extends StatefulWidget {
  const Satellite({Key? key}) : super(key: key);

  @override
  State<Satellite> createState() => _SatelliteState();
}

class _SatelliteState extends State<Satellite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background2.jpg'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    height: 345,
                    margin: const EdgeInsets.all(15),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(45,49,84, 40),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Icon(
                              FontAwesomeIcons.satellite,
                              size: 18,
                              color: Colors.white24,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'SATELLITE IMAGE',
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
                        Container(
                          height: 250,
                          child: Image.network(
                            'http://api.sat24.com/animated/IS/infraPolair/1/GTB%20Standard%20Time/8259361',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          thickness: 0.8,
                          color: Colors.white10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'sat24.com',
                              style: TextStyle(color: Colors.white24),
                            ),
                            Text(
                              'Copyright \u00a9 ',
                              style: TextStyle(color: Colors.white24),
                            ),
                          ],
                        ),

                        
                      ],
                      
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 345,
                        width: 380,
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(45,49,84, 40),
                          borderRadius: BorderRadius.circular(15),
                        ),


                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  FontAwesomeIcons.cloudRain,
                                  size: 18,
                                  color: Colors.white24,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'RAIN RADAR',
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
                            Container(
                              height: 250,

                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              thickness: 0.8,
                              color: Colors.white10,
                            ),

                    ],
                  ),
                      )
                ],
              )
            ],
          ),
        ]
        ),
      ),
    )
    );
  }
}
