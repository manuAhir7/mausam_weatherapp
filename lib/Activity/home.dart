import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dynamic_weather_icons/dynamic_weather_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mausam/Activity/navbar.dart';

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
      temp = "NA";
    } else {
      temp = ((info['temp_value']).toString()).substring(0, 4);
      air = ((info['air_speed_value']).toString()).substring(0, 4);
    }
    String icon = info['wicon_value'];
    String getCity = info['city_value'];
    if (temp == "NA") {
      getCity = "‍🥺💔";
    } else {
      getCity = info['city_value'] + " " + "💙";
    }
    String hum = info['hum_value'];
    String des = info['des_value'];
    var cityName = [
      "Mumbai", "Jabalpur", "Chennai", "Katni", "Lucknow", "London","New York","Amritsar",
      "Pune", "Indore", "Bhopal", "Gwalior", "Paris", "Varanasi","Satna",
    ];
    final random = Random();
    var city = cityName[random.nextInt(cityName.length)];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const Navbar(),
      appBar: AppBar(
        title: const Text('Mausam ⛅'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                margin: const EdgeInsets.fromLTRB(24, 20, 24, 32),
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
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                  Flexible(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3.45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 22, left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                WeatherIcon.getIcon('wi-thermometer'),
                                size: 30.0,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text("Temperature",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                child: Text(
                                  temp,
                                  style: const TextStyle(
                                    fontSize: 110,
                                  ),
                                  overflow: TextOverflow.fade,
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
                      padding: const EdgeInsets.only(
                          top: 18, bottom: 15, left: 15, right: 15),
                      height: MediaQuery.of(context).size.height / 4.2,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                WeatherIcon.getIcon('wi-cloudy-gusts'),
                                size: 30,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 16.0, left: 12),
                                child: Text("Air Speed",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Text(
                            air,
                            style: const TextStyle(
                                fontSize: 42, fontWeight: FontWeight.bold),
                          ),
                          const Text("km/hr",
                              style: TextStyle(fontWeight: FontWeight.w500)),
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
                      padding: const EdgeInsets.only(
                          top: 18, bottom: 15, left: 15, right: 15),
                      height: MediaQuery.of(context).size.height / 4.2,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                WeatherIcon.getIcon('wi-humidity'),
                                size: 30,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 16.0, left: 8),
                                child: Text("Humidity",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Text(
                            hum,
                            style: const TextStyle(
                                fontSize: 42, fontWeight: FontWeight.bold),
                          ),
                          const Text("%",
                              style: TextStyle(fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Container(
                  padding: const EdgeInsets.all(25),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Made by MANU❤",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.white)),
                      SizedBox(height: 2),
                      Text("Data provided by openweathermap.org",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400)),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
