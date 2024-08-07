import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/services/api_services.dart';

import '../models/weather_details_model.dart';

class WeatherDetailsProvider with ChangeNotifier {
  WeatherDetailsModel? weather;
  bool isLoading = false;
  String errorMessage = '';

  // WeatherDetailsModel? get weather => _weather;
  // bool get isLoading => _isLoading;
  // String get errorMessage => _errorMessage;

  Future<void> fetchWeather({String cityName = 'delhi'}) async {
    String urlEndpoint =
        'weather?q=$cityName&units=metric&appid=e1e9d633b25ae4825c1060042f93b5c3';
    isLoading = true;
    notifyListeners();

    try {
      ApiServices apiServices = ApiServices();
      var data = await apiServices.get(urlEndpoint: urlEndpoint);
      weather = WeatherDetailsModel.fromJson(data);
      log('try' + data.toString());
      errorMessage = '';
    } catch (e) {
      errorMessage = e.toString();
      log('catch >>>>>' + errorMessage);
      weather = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
