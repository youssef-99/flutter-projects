import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const apiKey = '5616acd1f458faf37cda033cd1deff44';
const openWeatherMapUrl = 'https://openweathermap.org/data/2.5/weather';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}


class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataLocation();

  }




  void getDataLocation () async{
    Location location = Location();
    await location.getCurrentLocation();

    Networking_healper networking_healper = Networking_healper('https://api.openweathermap.org/data/2.5/weather?lat=${location.lat}&lon=${location.long}&appid=$apiKey&units=metric');
    var data = await networking_healper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(
        data
      );
    }));
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRing(color: Colors.red,),
      ),
    );
  }
}
