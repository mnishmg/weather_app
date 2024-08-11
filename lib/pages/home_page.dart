import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../providers/weather_details_provider.dart';
import '../providers/weather_forecast_provider.dart';
import '../widgets/date_and_location.dart';
import '../widgets/search_field.dart';
import '../widgets/weather_details.dart';
import '../widgets/weather_forecast.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() =>
      _HomePageState(); // Create state for the HomePage.
}

class _HomePageState extends State<HomePage> {
  final _searchController =
      TextEditingController(); // Controller for the search field.

  final DateTime now = DateTime.now(); // Current date and time.

  @override
  void initState() {
    super.initState();
    // Fetch weather details and forecast data after the first frame is rendered.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<WeatherDetailsProvider>(context, listen: false)
          .fetchWeather();
      Provider.of<WeatherForecastProvider>(context, listen: false)
          .fetchForecast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF5F5F5), // Background color for the scaffold.
      body: SafeArea(
        child: Column(
          children: [
            // Search field widget to input city names.
            SearchField(
              searchController: _searchController,
              onTap: () {
                // Fetch weather details and forecast when search button is tapped.
                context
                    .read<WeatherDetailsProvider>()
                    .fetchWeather(cityName: _searchController.text);
                context
                    .read<WeatherForecastProvider>()
                    .fetchForecast(cityName: _searchController.text);
              },
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Consumer widget to listen to WeatherDetailsProvider changes.
                  Consumer<WeatherDetailsProvider>(
                    builder: (_, weatherDetailsProvider, child) {
                      if (weatherDetailsProvider.isLoading) {
                        // Show a loading spinner while fetching data.
                        return const Padding(
                          padding: EdgeInsets.all(appDefaultPadding * 5),
                          child: Center(
                              child: SpinKitWave(
                            color: Colors.black,
                            size: 24,
                          )),
                        );
                      } else if (weatherDetailsProvider
                          .errorMessage.isNotEmpty) {
                        // Display an error message if there's an error.
                        return Padding(
                          padding: const EdgeInsets.all(appDefaultPadding * 5),
                          child: Text(
                            weatherDetailsProvider.errorMessage,
                            style: textStyle16(
                                color: Colors.red, fontWeight: FontWeight.w700),
                          ),
                        );
                      } else if (weatherDetailsProvider.weather != null) {
                        // Display weather details if data is available.
                        return Column(
                          children: [
                            DateAndLocation(
                                timestamp: weatherDetailsProvider.weather!.dt!,
                                location:
                                    '${weatherDetailsProvider.weather!.name!}, ${weatherDetailsProvider.weather!.sys!.country!}'),
                            WeatherDetails(
                                temp:
                                    weatherDetailsProvider.weather!.main!.temp!,
                                weather: weatherDetailsProvider
                                    .weather!.weather!.first.main!,
                                maxTemp: weatherDetailsProvider
                                    .weather!.main!.tempMax!,
                                minTemp: weatherDetailsProvider
                                    .weather!.main!.tempMin!,
                                windSpeed: weatherDetailsProvider
                                    .weather!.wind!.speed!),
                          ],
                        );
                      } else {
                        // Display a message if no data is available.
                        return Text(
                          'No Data Available',
                          style: textStyle16(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        );
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: appDefaultPadding / 2,
                        vertical: appDefaultPadding / 4),
                    child: Text(
                      'Next 3 Hours Forecasting', // Title for the forecast section.
                      style: textStyle20(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                  // Consumer widget to listen to WeatherForecastProvider changes.
                  Consumer<WeatherForecastProvider>(
                    builder: (context, weatherForecastProvider, child) {
                      if (weatherForecastProvider.isLoading) {
                        // Show a loading spinner while fetching data.
                        return const Padding(
                          padding: EdgeInsets.all(appDefaultPadding * 5),
                          child: Center(
                              child: SpinKitWave(
                            color: Colors.black,
                            size: 24,
                          )),
                        );
                      } else if (weatherForecastProvider
                          .errorMessage.isNotEmpty) {
                        // Display an error message if there's an error.
                        return Padding(
                          padding: const EdgeInsets.all(appDefaultPadding * 5),
                          child: Text(
                            weatherForecastProvider.errorMessage,
                            style: textStyle16(
                                color: Colors.red, fontWeight: FontWeight.w700),
                          ),
                        );
                      } else if (weatherForecastProvider.forecast != null) {
                        // Display the weather forecast if data is available.
                        return WeatherForecast(
                          forecast: weatherForecastProvider.forecast!.list!,
                        );
                      } else {
                        // Display a message if no data is available.
                        return Text(
                          'No Data Available',
                          style: textStyle16(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
