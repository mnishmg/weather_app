import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../constants/constants.dart';

class DateAndLocation extends StatelessWidget {
  final int timestamp; final String location;
  const DateAndLocation(
      {super.key, required this.timestamp, required this.location});

  String formatedDate() {
    // Convert timestamp to DateTime
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);

    // Format the DateTime object
    String formattedDate = DateFormat('EEEE, MMM d').format(date);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: appDefaultPadding / 2,
          left: appDefaultPadding,
          right: appDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formatedDate(),
                style: textStyle12(color: Colors.black54),
              ),
              const SizedBox(height: appDefaultPadding / 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Iconsax.location5,
                    size: 16,
                  ),
                  const SizedBox(width: appDefaultPadding / 10),
                  Text(
                    location,
                    style: textStyle12(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            child: Icon(
              Iconsax.refresh5,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
