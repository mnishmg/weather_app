import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../constants/constants.dart';

class WeatherDetails extends StatelessWidget {
  // Weather details properties.
  final double temp;
  final String weather;
  final double maxTemp;
  final double minTemp;
  final double windSpeed;

  // Constructor for the WeatherDetails widget.
  const WeatherDetails({
    super.key,
    required this.temp,
    required this.weather,
    required this.maxTemp,
    required this.minTemp,
    required this.windSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: appDefaultPadding * 2), // Vertical padding.
      child: Column(
        children: [
          // Display current temperature.
          Text(
            '${temp.toString()}°',
            style: textStyle20(color: Colors.black, fontWeight: FontWeight.w900)
                .copyWith(fontSize: 48),
          ),
          // Display weather condition.
          Text(
            weather,
            style: textStyle16(color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: appDefaultPadding, // Spacing between elements.
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Display max temperature card.
              tempWindCard(
                cardIcon: Iconsax.arrow_up,
                cardData: maxTemp.toString(),
                cardTitle: 'Highest',
              ),
              // Display wind speed card.
              tempWindCard(
                cardIcon: Iconsax.wind,
                cardData: windSpeed.toString() + 'km/h',
                cardTitle: 'wind Speed',
              ),
              // Display min temperature card.
              tempWindCard(
                cardIcon: Iconsax.arrow_bottom,
                cardData: minTemp.toString(),
                cardTitle: 'Lowest',
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to create a card for temperature or wind speed details.
  Widget tempWindCard({
    required IconData cardIcon,
    String cardData = '',
    String cardTitle = '',
  }) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          child: Icon(
            cardIcon,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: appDefaultPadding / 4, // Spacing between elements.
        ),
        // Display data on the card.
        Text(
          cardData,
          style: textStyle12(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        // Display title of the card.
        Text(
          cardTitle,
          style: textStyle12(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
