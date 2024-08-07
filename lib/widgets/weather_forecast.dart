import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/constants.dart';

class WeatherForecast extends StatelessWidget {
  final List forecast; // List of forecast data.
  
  // Constructor for the WeatherForecast widget.
  const WeatherForecast({
    super.key,
    required this.forecast,
  });

  // Method to format the time from a DateTime object.
  String formatedTime(DateTime dateTime) {
    String formattedTime = DateFormat('hh\na').format(dateTime);
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: appDefaultPadding / 4),
        child: ListView.builder(
          itemCount: forecast.length, // Number of items in the forecast list.
          itemBuilder: (context, index) => Card(
            color: Colors.transparent,
            elevation: 0,
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(appDefaultPadding / 2),
              ),
              tileColor: Colors.black, // Background color of the ListTile.
              leading: Text(
                formatedTime(forecast[index].dtTxt), // Display formatted time.
                textAlign: TextAlign.center,
                style: textStyle16(
                  color: Colors.white, fontWeight: FontWeight.w500
                ),
              ),
              title: Text(
                forecast[index].weather!.first.main, // Display main weather info.
                style: textStyle16(
                  color: Colors.white, fontWeight: FontWeight.w500
                ),
              ),
              subtitle: Text(
                forecast[index].weather!.first.description, // Display weather description.
                style: textStyle12(color: Colors.white),
              ),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${forecast[index].main!.temp}°', // Display temperature.
                    style: textStyle20(
                      color: Colors.white, fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    'celsius', // Display temperature unit.
                    style: textStyle12(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
