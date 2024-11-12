import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermine/app/controller/ApiService.dart';
import 'package:fluttermine/app/controller/http.dart';
import 'package:fluttermine/app/model/Job.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'dart:core';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  test('fetchData returns a Data object', () async {
    // Arrange
    final mockClient = MockHttpClient();
    final jobService = JobService(client: mockClient);

    // Act
    when(mockClient.get(Uri.parse(
            'https://api.adzuna.com/v1/api/jobs/gb/search/1?app_id=0d6fe06e&app_key=c3c8b11888ffa0d6544ba27e6cfdce24&results_per_page=20&what=javascript%20developer&content-type=application/json')))
        .thenAnswer((_) async => http.Response('{"results": []}', 200));
    // Assert
    final jobData = await jobService.fetchData();
    expect(jobData, isA<Data>());
  });

  test('fetchData handles failure gracefully', () async {
    // Arrange
    final mockClient = MockHttpClient();
    final jobService = JobService(client: mockClient);

    // Act
    when(mockClient.get(Uri.parse(
            'https://api.adzuna.com/v1/api/jobs/gb/search/1?app_id=0d6fe06e&app_key=c3c8b11888ffa0d6544ba27e6cfdce24&results_per_page=20&what=javascript%20developer&content-type=application/json')))
        .thenThrow(http.ClientException('Server error'));

    // Assert
    expect(() async => await jobService.fetchData(), throwsException);
  });
}
