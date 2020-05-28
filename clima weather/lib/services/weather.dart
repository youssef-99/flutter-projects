import 'package:clima/services/networking.dart';

const apiKey = '5616acd1f458faf37cda033cd1deff44';
const openWeatherMapUrl = 'https://openweathermap.org/data/2.5/weather';


class WeatherModel {
   Future<dynamic> getCity (String cityName) async{
     var url = '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric';
     Networking_healper networking_healper= Networking_healper(url);
     var weatherData = await networking_healper.getData();
     return weatherData;
   }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
