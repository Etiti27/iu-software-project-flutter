import 'dart:convert';

import 'package:http/http.dart' as http;

class OpenWeather {
  late String openWeatherUrl;
  late dynamic responsed;

  OpenWeather(this.openWeatherUrl);

  Future<void> fetchData() async {
    final url = Uri.parse(openWeatherUrl); // Replace with your API endpoint

    try {
      final response = await http.get(url); // Make the GET request

      if (response.statusCode == 200) {
        // Decode the JSON response
        responsed = json.decode(response.body);
      } else {
        responsed = "not found";
      }
    } catch (e) {
      responsed = "error";
    }
  }

  getResponse() async {
    return responsed;
  }
}
