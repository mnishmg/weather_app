import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/constants.dart';

class WeatherForecast extends StatelessWidget {
  final List forecast;
  const WeatherForecast({
    super.key,
    required this.forecast,
  });

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
          itemCount: forecast.length,
          itemBuilder: (context, index) => Card(
            color: Colors.transparent,
            elevation: 0,
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(appDefaultPadding / 2)),
              tileColor: Colors.black,
              leading: Text(
                formatedTime(forecast[index].dtTxt),
                textAlign: TextAlign.center,
                style: textStyle16(
                    color: Colors.white, fontWeight: FontWeight.w500),
              ),
              title: Text(forecast[index].weather!.first.main,
                  style: textStyle16(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              subtitle: Text(forecast[index].weather!.first.description,
                  style: textStyle12(color: Colors.white)),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${forecast[index].main!.temp}°',
                      style: textStyle20(
                          color: Colors.white, fontWeight: FontWeight.w500)),
                  Text(
                    'celsius',
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
