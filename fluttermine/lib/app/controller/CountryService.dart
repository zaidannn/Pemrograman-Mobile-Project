import 'dart:convert';
import 'package:fluttermine/app/model/Country.dart';
import 'package:http/http.dart' as http;

class CountryService {
  static const String apiUrl =
      "http://api.adzuna.com/v1/api/jobs/gb/history?app_id=0d6fe06e&app_key=c3c8b11888ffa0d6544ba27e6cfdce24&location0=UK&location1=West%20Midlands&content-type=application/json";

  Future<Data> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      try {
        final jsonData = json.decode(response.body);
        return Data.fromJson(jsonData);
      } catch (e) {
        throw Exception('Failed to load data');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}

// Add the Data and Location classes as provided in your question