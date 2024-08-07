import 'package:flutter/material.dart';
import 'package:weather_app/services/api_services.dart';

import '../models/weather_details_model.dart';

class WeatherDetailsProvider with ChangeNotifier {
  WeatherDetailsModel? weather; // Variable to hold the weather details data.
  bool isLoading = false; // Variable to track the loading state.
  String errorMessage = ''; // Variable to hold any error messages.

  // Method to fetch the weather details for a given city.
  Future<void> fetchWeather({String cityName = 'delhi'}) async {
    String urlEndpoint = 'weather?q=$cityName&units=metric&appid=e1e9d633b25ae4825c1060042f93b5c3'; // Endpoint for the weather details API.
    isLoading = true; // Set loading state to true.
    notifyListeners(); // Notify listeners of state change.

    try {
      ApiServices apiServices = ApiServices(); // Create an instance of ApiServices.
      var data = await apiServices.get(urlEndpoint: urlEndpoint); // Fetch data from the API.
      weather = WeatherDetailsModel.fromJson(data); // Parse the data into a WeatherDetailsModel object.
      errorMessage = ''; // Clear any previous error messages.
    } catch (e) {
      errorMessage = e.toString(); // Set the error message.
      weather = null; // Clear the weather details data.
    } finally {
      isLoading = false; // Set loading state to false.
      notifyListeners(); // Notify listeners of state change.
    }
  }
}
