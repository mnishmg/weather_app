import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_details_provider.dart';
import 'package:weather_app/providers/weather_forecast_provider.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WeatherDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => WeatherForecastProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          useMaterial3: false,
        ),
        home: HomePage(),
      ),
    );
  }
}
