import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dynamic_weather_icons/dynamic_weather_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final info = ModalRoute.of(context)!.settings.arguments as Map;
    String temp = ((info['temp_value']).toString());
    String air = ((info['air_speed_value']).toString());
    if (temp == "city not found") {
      temp = "N/A";
    } else {
      temp = ((info['temp_value']).toString()).substring(0, 4);
      air = ((info['air_speed_value']).toString()).substring(0, 4);
    }
    String icon = info['wicon_value'];
    String getCity = info['city_value'];
    String hum = info['hum_value'];
    String des = info['des_value'];
    var cityName = [
      "Mumbai",
      "Jabalpur",
      "Chennai",
      "Katni",
      "Lucknow",
      "London",
      "Pune",
      "Indore",
      "Bhopal",
      "Gwalior",
      "Paris",
      "Varanasi",
    ];
    final random = Random();
    var city = cityName[random.nextInt(cityName.length)];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue.shade900,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade900, Colors.lightBlue.shade300]),
            ),
            child: Column(
              children: [
                Container(
                  //search bar container
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      )),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if ((_searchController.text).replaceAll(" ", "") ==
                              "") {
                            Fluttertoast.showToast(
                                msg: "please write something!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black54,
                                textColor: Colors.white,
                                fontSize: 14.0);
                            //print("Blank Search");
                          } else {
                            Navigator.pushReplacementNamed(context, "/loading",
                                arguments: {
                                  "searchText": _searchController.text,
                                });
                          }
                        },
                        child: Container(
                            margin: const EdgeInsets.fromLTRB(3, 0, 7, 0),
                            child: const Icon(
                              Icons.search,
                              color: Colors.blueAccent,
                              shadows: [
                                Shadow(color: Colors.white, blurRadius: 15.0)
                              ],
                            )),
                      ),
                      Expanded(
                        child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                                hintText: "Search for $city",
                                border: InputBorder.none),
                            onSubmitted: (value) {
                              if ((_searchController.text)
                                      .replaceAll(" ", "") ==
                                  "") {
                                Fluttertoast.showToast(
                                    msg: "please write something!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black54,
                                    textColor: Colors.white,
                                    fontSize: 14.0);
                                //print("Blank Search");
                              } else {
                                Navigator.pushReplacementNamed(
                                    context, "/loading",
                                    arguments: {
                                      "searchText": _searchController.text,
                                    });
                              }
                            }),
                      )
                    ],
                  ),
                ),
                //row1
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Image.network(
                                "https://openweathermap.org/img/wn/$icon@2x.png",
                                height: 100,
                                width: 100),
                            const SizedBox(width: 15),
                            Column(
                              children: [
                                Text(
                                  des,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 7),
                                Text(getCity,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //row2
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 230,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        padding: const EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              WeatherIcon.getIcon('wi-thermometer'),
                              //color: Colors.white,
                              size: 30.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  temp,
                                  style: const TextStyle(
                                    fontSize: 110,
                                  ),
                                ),
                                const Text(
                                  "°C",
                                  style: TextStyle(
                                    fontSize: 40,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: const EdgeInsets.all(26),
                        height: 200,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  WeatherIcon.getIcon('wi-cloudy-gusts'),
                                  //color: Colors.white,
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Text(
                              air,
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            const Text("km/hr"),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                        padding: const EdgeInsets.all(26),
                        height: 200,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  WeatherIcon.getIcon('wi-humidity'),
                                  //color: Colors.white,
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Text(
                              hum,
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            const Text("%"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text("Made by MANU❤",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w900)),
                        Text("Data provided by openweather.org",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400)),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
