// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:provider/provider.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';

// import '../constants/constants.dart';
// import '../providers/weather_details_provider.dart';
// import '../providers/weather_forecast_provider.dart';
// import '../widgets/date_and_location.dart';
// import '../widgets/search_field.dart';
// import '../widgets/weather_details.dart';
// import '../widgets/weather_forecast.dart';

// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() =>
//       _HomePageState(); // Create state for the HomePage.
// }

// class _HomePageState extends State<HomePage> {
//   final _searchController =
//       TextEditingController(); // Controller for the search field.

//   final DateTime now = DateTime.now(); // Current date and time.

//   @override
//   void initState() {
//     super.initState();
//     // Fetch weather details and forecast data after the first frame is rendered.
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<WeatherDetailsProvider>(context, listen: false)
//           .fetchWeather();
//       Provider.of<WeatherForecastProvider>(context, listen: false)
//           .fetchForecast();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor:
//             const Color(0xFFF5F5F5), // Background color for the scaffold.
//         body: SafeArea(
//           child: SlidingUpPanel(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(appDefaultPadding),
//                 topRight: Radius.circular(appDefaultPadding)),
//             body: Padding(
//               padding: const EdgeInsets.all(appDefaultPadding),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: appDefaultPadding),
//                   RichText(
//                       text: TextSpan(children: [
//                     TextSpan(
//                         text: 'Good Evening! ',
//                         style: textStyle20(
//                             color: Colors.black, fontWeight: FontWeight.w800)),
//                     TextSpan(
//                         text: 'Manish',
//                         style: textStyle20(
//                             color: Colors.black, fontWeight: FontWeight.w600)),
//                     TextSpan(
//                         text: '\nMonday, Aug 12',
//                         style: textStyle16(
//                                 color: Colors.black54,
//                                 fontWeight: FontWeight.w600)
//                             .copyWith(fontSize: 14)),
//                   ])),
//                   const SizedBox(height: appDefaultPadding * 2),
//                   // Search field widget to input city names.
//                   SearchField(
//                     searchController: _searchController,
//                     onTap: () {
//                       // Fetch weather details and forecast when search button is tapped.
//                       context
//                           .read<WeatherDetailsProvider>()
//                           .fetchWeather(cityName: _searchController.text);
//                       context
//                           .read<WeatherForecastProvider>()
//                           .fetchForecast(cityName: _searchController.text);
//                     },
//                   ),

//                   Consumer<WeatherDetailsProvider>(
//                       builder: (context, weatherDetailsProvider, child) {
//                     return Column(
//                       children: [
//                         SizedBox(height: appDefaultPadding * 2.5),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Icon(
//                               Iconsax.location5,
//                               size: 20,
//                             ),
//                             const SizedBox(width: appDefaultPadding / 10),
//                             Text(
//                               '${weatherDetailsProvider.weather!.name!}, ${weatherDetailsProvider.weather!.sys!.country!}',
//                               style: textStyle16(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: appDefaultPadding / 2),
//                         Text(
//                           '${weatherDetailsProvider.weather!.main!.temp!}°',
//                           style: textStyle20(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w900)
//                               .copyWith(fontSize: 48),
//                         ),
//                         Text(
//                           weatherDetailsProvider.weather!.weather!.first.main!,
//                           style: textStyle16(
//                               color: Colors.black, fontWeight: FontWeight.w700),
//                         ),
//                         const SizedBox(height: appDefaultPadding * 2.5),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Container(
//                                 width: double.infinity,
//                                 padding: EdgeInsets.all(appDefaultPadding / 2),
//                                 decoration: BoxDecoration(
//                                     color: Colors.black,
//                                     borderRadius: BorderRadius.circular(
//                                         appDefaultPadding / 2)),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(
//                                       Iconsax.sun_15,
//                                       size: 28,
//                                       color: Colors.amber.shade300,
//                                     ),
//                                     SizedBox(width: appDefaultPadding / 2),
//                                     Text(
//                                       'Sun Rise',
//                                       style: textStyle12(color: Colors.white),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: appDefaultPadding),
//                             Expanded(
//                               child: Container(
//                                 width: double.infinity,
//                                 padding: EdgeInsets.all(appDefaultPadding / 2),
//                                 decoration: BoxDecoration(
//                                     color: Colors.black,
//                                     borderRadius: BorderRadius.circular(
//                                         appDefaultPadding / 2)),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(
//                                       Iconsax.sun_fog5,
//                                       size: 28,
//                                       color: Colors.orange.shade300,
//                                     ),
//                                     SizedBox(width: appDefaultPadding / 2),
//                                     Text(
//                                       'Sun Rise',
//                                       style: textStyle12(color: Colors.white),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: appDefaultPadding),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Column(
//                               children: [
//                                 const CircleAvatar(
//                                   radius: 24,
//                                   backgroundColor: Colors.white,
//                                   child: Icon(
//                                     Iconsax.arrow_up,
//                                     color: Colors.black54,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: appDefaultPadding /
//                                       2, // Spacing between elements.
//                                 ),
//                                 // Display data on the card.
//                                 Text(
//                                   '${weatherDetailsProvider.weather!.main!.tempMax!}°',
//                                   style: textStyle12(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                                 // Display title of the card.
//                                 Text(
//                                   'Highest',
//                                   style: textStyle12(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 const CircleAvatar(
//                                   radius: 24,
//                                   backgroundColor: Colors.white,
//                                   child: Icon(
//                                     Iconsax.wind,
//                                     color: Colors.black54,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: appDefaultPadding /
//                                       2, // Spacing between elements.
//                                 ),
//                                 // Display data on the card.
//                                 Text(
//                                   '${weatherDetailsProvider.weather!.wind!.speed!} km/h',
//                                   style: textStyle12(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                                 // Display title of the card.
//                                 Text(
//                                   'Wind Speed',
//                                   style: textStyle12(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 const CircleAvatar(
//                                   radius: 24,
//                                   backgroundColor: Colors.white,
//                                   child: Icon(
//                                     Iconsax.arrow_bottom,
//                                     color: Colors.black54,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: appDefaultPadding /
//                                       2, // Spacing between elements.
//                                 ),
//                                 // Display data on the card.
//                                 Text(
//                                   '${weatherDetailsProvider.weather!.main!.tempMin!}°',
//                                   style: textStyle12(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                                 // Display title of the card.
//                                 Text(
//                                   'Lowest',
//                                   style: textStyle12(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         )
//                       ],
//                     );
//                   })
//                 ],
//               ),
//             ),
//             panel: Column(
//               children: [
//                 Container(
//                   margin:
//                       const EdgeInsets.symmetric(vertical: appDefaultPadding),
//                   width: 30,
//                   height: 5,
//                   decoration: const BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.all(
//                         Radius.circular(appDefaultPadding / 2)),
//                   ),
//                 ),
//                 Text(
//                   'Next 3 Hours Forecasting', // Title for the forecast section.
//                   style: textStyle16(
//                       color: Colors.black, fontWeight: FontWeight.w700),
//                 ),
//                 SizedBox(height: appDefaultPadding),
//                 // Consumer widget to listen to WeatherForecastProvider changes.
//                 Consumer<WeatherForecastProvider>(
//                   builder: (context, weatherForecastProvider, child) {
//                     if (weatherForecastProvider.isLoading) {
//                       // Show a loading spinner while fetching data.
//                       return const Padding(
//                         padding: EdgeInsets.all(appDefaultPadding * 5),
//                         child: Center(
//                             child: SpinKitWave(
//                           color: Colors.black,
//                           size: 24,
//                         )),
//                       );
//                     } else if (weatherForecastProvider
//                         .errorMessage.isNotEmpty) {
//                       // Display an error message if there's an error.
//                       return Padding(
//                         padding: const EdgeInsets.all(appDefaultPadding * 5),
//                         child: Text(
//                           weatherForecastProvider.errorMessage,
//                           style: textStyle16(
//                               color: Colors.red, fontWeight: FontWeight.w700),
//                         ),
//                       );
//                     } else if (weatherForecastProvider.forecast != null) {
//                       // Display the weather forecast if data is available.
//                       return WeatherForecast(
//                         forecast: weatherForecastProvider.forecast!.list!,
//                       );
//                     } else {
//                       // Display a message if no data is available.
//                       return Text(
//                         'No Data Available',
//                         style: textStyle16(
//                             color: Colors.black, fontWeight: FontWeight.w700),
//                       );
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
