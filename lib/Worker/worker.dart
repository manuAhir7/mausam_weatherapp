import 'package:http/http.dart';
import 'dart:convert';

class Worker {
  late String temp;
  late String location;
  late String humidity;
  late String airSpeed;
  late String description;
  late String main;
  late String wicon;

  //constructor
  Worker({required this.location});

  //method to fetch data
  Future<void> getdata() async {
    try {
      Response response = await get(Uri.parse(
          'http://api.openweathermap.org/data/2.5/weather?q=$location&appid=dd6c94ae0f23f48166e996e7c14dce3c'));
      Map data = jsonDecode(response.body);

      //Getting Temp,Humidiy
      Map tempData = data['main'];
      String getHumidity = tempData['humidity'].toString();
      double getTemp = tempData['temp'] - 273.15;

      //Getting air_speed
      Map wind = data['wind'];
      double getAirSpeed = wind["speed"] / 0.277778;

      //Getting Description
      List weatherData = data['weather'];
      Map weatherMainData = weatherData[0];
      String getMainDes = weatherMainData['main'];
      String getDesc = weatherMainData["description"];

      //Assigning Values
      temp = getTemp.toString();
      humidity = getHumidity;
      airSpeed = getAirSpeed.toString();
      description = getDesc;
      main = getMainDes;
      wicon = weatherMainData["icon"].toString();
    } catch (e) {
      temp = "city not found";
      humidity = "NA";
      airSpeed = "NA";
      description = "City Not Found";
      main = "N/A";
      wicon = "09d";
    }
  }
}
