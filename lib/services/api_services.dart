import 'dart:convert';

import 'package:http/http.dart' as httpClient;

import 'api_exceptions.dart';

class ApiServices {
  String baseUrl =
      'http://api.openweathermap.org/data/2.5/'; // Base URL for the API.

  // Method to make a GET request to the specified endpoint with optional headers.
  Future<dynamic> get({
    required String
        urlEndpoint, // Required endpoint to be appended to the base URL.
    Map<String, String>? headers, // Optional headers for the request.
  }) async {
    // Make the GET request.
    var response = await httpClient.get(Uri.parse(baseUrl + urlEndpoint),
        headers: headers);
    return checkResponse(
        response); // Check the response for errors or decode the JSON.
  }

  // Method to check the response status code and handle errors.
  dynamic checkResponse(httpClient.Response response) {
    switch (response.statusCode) {
      case 200:
        // If the response is successful (status code 200), decode the JSON.
        return json.decode(response.body);
      case 401:
        // If the response indicates unauthorized access (status code 401), throw an UnauthorisedException.
        throw UnauthorisedException(response.body);
      case 404:
        // If the response indicates not found (status code 404), throw a NotFoundException.
        throw NotFoundException(response.body);
    }
  }
}
