import 'package:chris_dev_app/Method/CountryShortCodes.dart';
import 'package:chris_dev_app/Method/GeoLocator.dart';
import 'package:chris_dev_app/Method/OpenWeather.dart';
import 'package:chris_dev_app/widgets/AppBarWidget.dart';
import 'package:chris_dev_app/widgets/BottomAppWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../widgets/ShowSideModalSheet.dart';

class Weatherapp extends StatefulWidget {
  static const String id = "weatherapp";

  @override
  State<Weatherapp> createState() => _WeatherappState();
}

class _WeatherappState extends State<Weatherapp> {
  @override
  void initState() {
    super.initState();

    getLocation();
  }

  late String resultFromCitySearch;
  late double temperature;
  late double temperatureFeel;
  late String iconUrl;
  late String countryShortCode;
  late String place;
  late String country;
  late String description;

  String getCountry(String code) {
    CountryShortCodes countryShortCodes = CountryShortCodes(code);
    countryShortCodes.country();
    String country = countryShortCodes.countryName;
    return country;
  }

  void getLocation() async {
    Geolocators geolocation = Geolocators();
    await geolocation.determinePosition();

    double longitude = geolocation.getLongitude();
    double latitude = geolocation.getLatitude();
    String url = "https://api.openweathermap.org/data/2.5/weather?"
        "lat=$latitude&units=metric&lon=$longitude&appid=${dotenv.env['API_KEY']}";
    getWeather(url);
  }

  // void fetching() async {
  //   if (resultFromCitySearch == null) {
  //     String url = "https://api.openweathermap.org/data/2.5/weather?"
  //         "q=enugu&appid=${dotenv.env['API_KEY']}";
  //     getWeather(url);
  //   } else {
  //     getLocation();
  //     String url = "https://api.openweathermap.org/data/2.5/weather?"
  //         "lat=$latitude&units=metric&lon=$longitude&appid=${dotenv.env['API_KEY']}";
  //     getWeather(url);
  //   }
  // }

  // if (resultFromCitySearch == null) {
  // url = "https://api.openweathermap.org/data/2.5/weather?"
  // "q=enugu&appid=${dotenv.env['API_KEY']}";
  // } else {
  // url = "https://api.openweathermap.org/data/2.5/weather?"
  // "lat=$latitude&units=metric&lon=$longitude&appid=${dotenv.env['API_KEY']}";
  // }
  void getWeather(url) async {
    OpenWeather weather = OpenWeather(url);
    await weather.fetchData();
    dynamic data = weather.responsed;
    print("chris data is $data");
    if (data == "not found") {
      setState(() {
        isNoData = false;
        description = "Not Found";
        String icon = "Not Found";
        place = "Not Found";
        // iconUrl = "https://openweathermap.org/img/wn/$icon@4x.png";
        temperature = 0;
        temperatureFeel = 0;
        countryShortCode = "Not Found";
        country = "Not Found";
      });
    } else {
      setState(() {
        isNoData = false;
        description = data["weather"][0]["description"];
        String icon = data["weather"][0]["icon"];
        place = data["name"];
        iconUrl = "https://openweathermap.org/img/wn/$icon@4x.png";
        temperature = data["main"]["temp"];
        temperatureFeel = data["main"]["feels_like"];
        countryShortCode = data["sys"]["country"];
        country = getCountry(countryShortCode);
      });
    }
  }

  bool isNoData = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new),
          ),
          "Weather App"),
      bottomNavigationBar: bottomAppWidget(),
      body: isNoData
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image(
                        image: NetworkImage(iconUrl),
                      ),
                      Expanded(
                        child: Text(
                          description.toUpperCase(),
                          style: const TextStyle(
                              fontFamily: "Roboto", fontSize: 30.0),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Text(
                      country.toUpperCase(),
                      style:
                          const TextStyle(fontFamily: "Roboto", fontSize: 32),
                    ),
                    // AnimatedTextKit(
                    //   animatedTexts: [
                    //     TypewriterAnimatedText(
                    //       country.toUpperCase(),
                    //       textStyle: const TextStyle(
                    //         fontSize: 32.0,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //       speed: const Duration(milliseconds: 250),
                    //     ),
                    //   ],
                    //   repeatForever: true,
                    // ),
                  ),
                ),
                Expanded(
                  child: Text(
                    place,
                    style: TextStyle(fontFamily: "Roboto", fontSize: 30),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "${temperature.toStringAsFixed(1)} \u00B0C",
                      style:
                          const TextStyle(fontFamily: "Roboto", fontSize: 40),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      "feels like",
                      style: TextStyle(
                          fontFamily: "Roboto-italics",
                          fontStyle: FontStyle.italic,
                          fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${temperatureFeel.toStringAsFixed(1)} \u00B0C",
                      style:
                          const TextStyle(fontFamily: "Roboto", fontSize: 20.0),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: GestureDetector(
                          onTap: () async {
                            String? result = await showSideModalSheet(context);
                            print("i got back this $result");
                            setState(() {
                              String url =
                                  "https://api.openweathermap.org/data/2.5/weather?"
                                  "q=$result&units=metric&appid=${dotenv.env['API_KEY']}";
                              getWeather(url);
                            });
                          },
                          child: const Icon(
                            Icons.location_city,
                            size: 50.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
