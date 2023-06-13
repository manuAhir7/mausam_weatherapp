import 'package:flutter/material.dart';
import 'package:mausam/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String city = "Jabalpur";
  String? temp;
  String? hum;
  String? airSpeed;
  String? des;
  String? main;
  String? wicon;

  void startApp(String city) async {
    Worker instance = Worker(location: city);
    await instance.getdata();

    temp = instance.temp;
    hum = instance.humidity;
    airSpeed = instance.airSpeed;
    des = instance.description;
    main = instance.main;
    wicon = instance.wicon;
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "hum_value": hum,
        "air_speed_value": airSpeed,
        "des_value": des,
        "main_value": main,
        "wicon_value": wicon,
        "city_value": city,
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;
    if (search?.isNotEmpty ?? false) {
      city = search!['searchText'];
    }
    startApp(city);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/mlogo.png", height: 260, width: 260),
          const Text("Mausam 🌤️",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                letterSpacing: 2,
              )),
          const SizedBox(
            height: 25,
          ),
          const SpinKitThreeBounce(
            color: Colors.white70,
            size: 50.0,
          ),
        ],
      ),
      backgroundColor: Colors.blue[900],
    );
  }
}
