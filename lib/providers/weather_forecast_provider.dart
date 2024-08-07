import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_model.dart';
import '../services/api_services.dart';

class WeatherForecastProvider extends ChangeNotifier {
  WeatherForecastModel? forecast;
  bool isLoading = false;
  String errorMessage = '';

  Future<void> fetchForecast({String cityName = 'delhi'}) async {
    String urlEndpoint =
        'forecast?q=$cityName&cnt=5&units=metric&appid=e1e9d633b25ae4825c1060042f93b5c3';
    isLoading = true;
    notifyListeners();

    try {
      ApiServices apiServices = ApiServices();
      var data = await apiServices.get(urlEndpoint: urlEndpoint);
      forecast = WeatherForecastModel.fromJson(data);
      log('try' + data.toString());
      errorMessage = '';
    } catch (e) {
      errorMessage = e.toString();
      log('catch >>>>>' + errorMessage);
      forecast = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
