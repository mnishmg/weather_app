import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/splash_page.dart';

import 'pages/home_page.dart';
import 'providers/forecast_provider.dart';
import 'providers/weather_provider.dart';

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
          create: (_) => WeatherProvider(),
        ),
        // Provides the WeatherForecastProvider instance
        ChangeNotifierProvider(
          create: (_) => ForecastProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          useMaterial3: false, // Uses Material 2 design components.
        ),
        home: SplashPage(),
      ),
    );
  }
}
