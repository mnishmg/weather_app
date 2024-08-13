import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../constants/constants.dart';
import '../providers/forecast_provider.dart';
import '../providers/weather_provider.dart';
import '../widgets/search_field.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() =>
      _HomePageState(); // Create state for the HomePage.
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();

  final DateTime now = DateTime.now();

  String formatedTime(DateTime dateTime) {
    String formattedTime = DateFormat('hh\na').format(dateTime);
    return formattedTime;
  }

  @override
  void initState() {
    super.initState();
    // Fetch weather details and forecast data after the first frame is rendered.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<WeatherProvider>(context, listen: false).fetchWeather();
      Provider.of<ForecastProvider>(context, listen: false).fetchForecast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SlidingUpPanel(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(appDefaultPadding),
              topRight: Radius.circular(appDefaultPadding)),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: appDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: appDefaultPadding * 2),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Good Evening! ',
                        style: textStyle20(
                            color: Colors.black, fontWeight: FontWeight.w800)),
                    TextSpan(
                        text: 'Manish',
                        style: textStyle20(
                            color: Colors.black, fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: '\n${DateFormat('EEEE, MMM d').format(now)}',
                        style: textStyle16(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600)
                            .copyWith(fontSize: 14)),
                  ]),
                ),
                const SizedBox(height: appDefaultPadding * 2),
                SearchField(
                  searchController: _searchController,
                  onTap: () {
                    context
                        .read<WeatherProvider>()
                        .fetchWeather(cityName: _searchController.text);
                    context
                        .read<ForecastProvider>()
                        .fetchForecast(cityName: _searchController.text);
                  },
                ),
                Consumer<WeatherProvider>(
                    builder: (context, weatherProvider, child) {
                  String sunTiming(int value) {
                    return DateFormat('HH:mm').format(
                        DateTime.fromMillisecondsSinceEpoch(value * 1000));
                  }

                  if (weatherProvider.isLoading) {
                    return const Padding(
                      padding: EdgeInsets.all(appDefaultPadding * 5),
                      child: Center(
                          child: SpinKitWave(
                        color: Colors.black,
                        size: 24,
                      )),
                    );
                  } else if (weatherProvider.errorMessage.isNotEmpty) {
                    // Display an error message if there's an error.
                    return Padding(
                      padding: const EdgeInsets.all(appDefaultPadding * 5),
                      child: Text(
                        weatherProvider.errorMessage,
                        style: textStyle16(
                            color: Colors.red, fontWeight: FontWeight.w700),
                      ),
                    );
                  } else if (weatherProvider.weather != null) {
                    return Column(
                      children: [
                        const SizedBox(height: appDefaultPadding * 2.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Iconsax.location5,
                              size: 20,
                            ),
                            const SizedBox(width: appDefaultPadding / 10),
                            Text(
                              '${weatherProvider.weather!.name!}, ${weatherProvider.weather!.sys!.country!}',
                              style: textStyle16(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Text(
                          '${weatherProvider.weather!.main!.temp!}°',
                          style: textStyle20(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900)
                              .copyWith(fontSize: 48),
                        ),
                        Text(
                          weatherProvider.weather!.weather!.first.main!,
                          style: textStyle16(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: appDefaultPadding * 2.5),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.all(appDefaultPadding / 2),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(
                                        appDefaultPadding / 2)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Iconsax.sun_15,
                                      size: 28,
                                      color: Colors.amber.shade300,
                                    ),
                                    const SizedBox(
                                        width: appDefaultPadding / 2),
                                    Text(
                                      '${sunTiming(weatherProvider.weather!.sys!.sunrise!)} AM',
                                      style: textStyle12(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: appDefaultPadding),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.all(appDefaultPadding / 2),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(
                                        appDefaultPadding / 2)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Iconsax.sun_fog5,
                                      size: 28,
                                      color: Colors.orange.shade300,
                                    ),
                                    const SizedBox(
                                        width: appDefaultPadding / 2),
                                    Text(
                                      '${sunTiming(weatherProvider.weather!.sys!.sunset!)} PM',
                                      style: textStyle12(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: appDefaultPadding * 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Iconsax.arrow_up,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(
                                  height: appDefaultPadding /
                                      2, // Spacing between elements.
                                ),
                                // Display data on the card.
                                Text(
                                  '${weatherProvider.weather!.main!.tempMax!}°',
                                  style: textStyle12(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                // Display title of the card.
                                Text(
                                  'Highest',
                                  style: textStyle12(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Iconsax.wind,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(
                                  height: appDefaultPadding /
                                      2, // Spacing between elements.
                                ),
                                // Display data on the card.
                                Text(
                                  '${weatherProvider.weather!.wind!.speed!} km/h',
                                  style: textStyle12(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                // Display title of the card.
                                Text(
                                  'Wind Speed',
                                  style: textStyle12(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Iconsax.arrow_bottom,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(
                                  height: appDefaultPadding /
                                      2, // Spacing between elements.
                                ),
                                // Display data on the card.
                                Text(
                                  '${weatherProvider.weather!.main!.tempMin!}°',
                                  style: textStyle12(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                // Display title of the card.
                                Text(
                                  'Lowest',
                                  style: textStyle12(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        )
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
                })
              ],
            ),
          ),
          panel: Column(
            children: [
              Container(
                height: 5,
                width: 30,
                margin: const EdgeInsets.symmetric(vertical: appDefaultPadding),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius:
                      BorderRadius.all(Radius.circular(appDefaultPadding / 2)),
                ),
              ),
              Text(
                'Next 3 Hours Forecasting',
                style: textStyle16(
                    color: Colors.black, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: appDefaultPadding / 2),
              Expanded(
                child: Consumer<ForecastProvider>(
                  builder: (context, forecastProvider, child) {
                    if (forecastProvider.isLoading) {
                      return const Padding(
                        padding: EdgeInsets.all(appDefaultPadding * 5),
                        child: Center(
                            child: SpinKitWave(
                          color: Colors.black,
                          size: 24,
                        )),
                      );
                    } else if (forecastProvider.errorMessage.isNotEmpty) {
                      // Display an error message if there's an error.
                      return Padding(
                        padding: const EdgeInsets.all(appDefaultPadding * 5),
                        child: Text(
                          forecastProvider.errorMessage,
                          style: textStyle16(
                              color: Colors.red, fontWeight: FontWeight.w700),
                        ),
                      );
                    } else if (forecastProvider.forecast != null) {
                      return ListView.builder(
                        itemCount: forecastProvider.forecast!.list!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.transparent,
                            elevation: 0,
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    appDefaultPadding / 2),
                              ),
                              tileColor: Colors
                                  .black, // Background color of the ListTile.
                              leading: Text(
                                formatedTime(forecastProvider
                                    .forecast!
                                    .list![index]
                                    .dtTxt!), // Display formatted time.
                                textAlign: TextAlign.center,
                                style: textStyle16(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              title: Text(
                                forecastProvider.forecast!.list![index].weather!
                                    .first.main!, // Display main weather info.
                                style: textStyle16(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                forecastProvider
                                    .forecast!
                                    .list![index]
                                    .weather!
                                    .first
                                    .description!, // Display weather description.
                                style: textStyle12(color: Colors.white),
                              ),
                              trailing: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${forecastProvider.forecast!.list![index].main!.temp}°', // Display temperature.
                                    style: textStyle20(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'celsius', // Display temperature unit.
                                    style: textStyle12(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
