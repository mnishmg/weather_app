import 'package:flutter/material.dart';
import 'package:weather_app/services/api_services.dart';

import '../models/weather_details_model.dart';

class WeatherProvider with ChangeNotifier {
  WeatherDetailsModel? weather;
  bool isLoading = false;
  String errorMessage = '';

  Future<void> fetchWeather({String cityName = 'delhi'}) async {
    String urlEndpoint = 'weather?q=$cityName&units=metric&appid=e1e9d633b25ae4825c1060042f93b5c3'; // Endpoint for the weather details API.
    isLoading = true;
    notifyListeners();

    try {
      ApiServices apiServices = ApiServices();
      var data = await apiServices.get(urlEndpoint: urlEndpoint);
      weather = WeatherDetailsModel.fromJson(data);
      errorMessage = '';
    } catch (e) {
      errorMessage = e.toString();
      weather = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
