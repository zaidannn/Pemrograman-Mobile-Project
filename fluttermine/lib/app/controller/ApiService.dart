import 'dart:convert';
import 'package:fluttermine/app/controller/http.dart';
import 'package:fluttermine/app/model/job.dart';

class JobService {
  final HttpClient client;

  // Pass the HttpClient as a named parameter in the constructor
  JobService({required this.client});

  static const String apiUrl =
      "https://api.adzuna.com/v1/api/jobs/gb/search/1?app_id=0d6fe06e&app_key=c3c8b11888ffa0d6544ba27e6cfdce24&results_per_page=20&what=javascript%20developer&content-type=application/json";

  Future<Data> fetchData() async {
    try {
      final response = await client.get(Uri.parse(apiUrl));

      print('Response status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        // Add a null check before accessing the results field
        if (jsonData['results'] != null) {
          return Data.fromJson(jsonData);
        } else {
          throw Exception('No results in JSON data');
        }
      } else {
        throw Exception('Failed to load data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error during API call: $e');
      throw Exception('Failed to load data');
    }
  }
}
