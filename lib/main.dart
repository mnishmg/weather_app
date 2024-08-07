import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';
import 'providers/weather_details_provider.dart';
import 'providers/weather_forecast_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provides the WeatherDetailsProvider instance
        ChangeNotifierProvider(
          create: (_) => WeatherDetailsProvider(),
        ),
        // Provides the WeatherForecastProvider instance
        ChangeNotifierProvider(
          create: (_) => WeatherForecastProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          useMaterial3: false, // Uses Material 2 design components.
        ),
        home: HomePage(),
      ),
    );
  }
}
