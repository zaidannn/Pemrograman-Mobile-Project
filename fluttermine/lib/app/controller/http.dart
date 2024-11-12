import 'package:http/http.dart' as http;

abstract class HttpClient {
  Future<http.Response> get(Uri url);
}

class RealHttpClient implements HttpClient {
  final http.Client _client = http.Client();

  @override
  Future<http.Response> get(Uri url) => _client.get(url);
}
