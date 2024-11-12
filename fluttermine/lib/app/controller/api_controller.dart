// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:fluttermine/app/model/job.dart';

// class ApiController extends GetxController {
//   var jobData = <Result>[].obs; // Menggunakan List<Result> sebagai tipe data

//   final String baseUrl = 'https://api.adzuna.com/v1/api/jobs/gb';
//   final String appId = '0d6fe06e';
//   final String appKey = 'c3c8b11888ffa0d6544ba27e6cfdce24';

//   Future<void> fetchData(int page) async {
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl/search/$page?app_id=$appId&app_key=$appKey'),
//       );

//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         final data = Data.fromJson(jsonData);
//         jobData.assignAll(
//             data.results); // Menggunakan data.results dari objek Data
//       } else {
//         throw Exception('Failed to fetch data');
//       }
//     } catch (e) {
//       print('Error fetching data: $e');
//     }
//   }
// }
