import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_model.dart';
import '../services/api_services.dart';

class WeatherForecastProvider extends ChangeNotifier {
  WeatherForecastModel? forecast; // Variable to hold the weather forecast data.
  bool isLoading = false; // Variable to track the loading state.
  String errorMessage = ''; // Variable to hold any error messages.

  // Method to fetch the weather forecast for a given city.
  Future<void> fetchForecast({String cityName = 'delhi'}) async {
    String urlEndpoint = 'forecast?q=$cityName&cnt=5&units=metric&appid=e1e9d633b25ae4825c1060042f93b5c3'; // Endpoint for the weather forecast API.
    isLoading = true; // Set loading state to true.
    notifyListeners(); // Notify listeners of state change.

    try {
      ApiServices apiServices = ApiServices(); // Create an instance of ApiServices.
      var data = await apiServices.get(urlEndpoint: urlEndpoint); // Fetch data from the API.
      forecast = WeatherForecastModel.fromJson(data); // Parse the data into a WeatherForecastModel object.
      errorMessage = ''; // Clear any previous error messages.
    } catch (e) {
      errorMessage = e.toString(); // Set the error message.
      forecast = null; // Clear the forecast data.
    } finally {
      isLoading = false; // Set loading state to false.
      notifyListeners(); // Notify listeners of state change.
    }
  }
}
