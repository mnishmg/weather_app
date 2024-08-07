import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../constants/constants.dart';

class WeatherDetails extends StatelessWidget {
  final double temp;
  final String weather;
  final double maxTemp;
  final double minTemp;
  final double windSpeed;
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
      padding: const EdgeInsets.symmetric(vertical: appDefaultPadding * 2),
      child: Column(
        children: [
          Text(
            temp.toString(),
            style: textStyle20(color: Colors.black, fontWeight: FontWeight.w900)
                .copyWith(fontSize: 48),
          ),
          Text(
            weather,
            style:
                textStyle16(color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: appDefaultPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              tempWindCard(
                  cardIcon: Iconsax.arrow_up,
                  cardData: maxTemp.toString(),
                  cardTitle: 'Highest'),
              tempWindCard(
                  cardIcon: Iconsax.wind,
                  cardData: windSpeed.toString() + 'km/h',
                  cardTitle: 'wind Speed'),
              tempWindCard(
                  cardIcon: Iconsax.arrow_bottom,
                  cardData: minTemp.toString(),
                  cardTitle: 'Lowest'),
            ],
          )
        ],
      ),
    );
  }

  Widget tempWindCard(
      {required IconData cardIcon,
      String cardData = '',
      String cardTitle = ''}) {
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
          height: appDefaultPadding / 4,
        ),
        Text(
          cardData,
          style: textStyle12(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        Text(
          cardTitle,
          style: textStyle12(color: Colors.black, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
