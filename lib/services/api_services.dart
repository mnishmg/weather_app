import 'dart:convert';

import 'package:http/http.dart' as httpClient;

import 'api_exceptions.dart';

class ApiServices {
  String baseUrl = 'http://api.openweathermap.org/data/2.5/';
  Future<dynamic> get(
      {required String urlEndpoint, Map<String, String>? headers}) async {
    var response = await httpClient.get(Uri.parse(baseUrl + urlEndpoint),
        headers: headers);
    return checkResponse(response);
  }

  dynamic checkResponse(httpClient.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 401:
        throw UnauthorisedException(response.body);
      case 404:
        throw NotFoundException(response.body);
    }
  }
}
