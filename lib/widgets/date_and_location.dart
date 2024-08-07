import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../constants/constants.dart';

class DateAndLocation extends StatelessWidget {
  final int timestamp; // Timestamp for the date.
  final String location; // Location name.

  // Constructor for the DateAndLocation widget.
  const DateAndLocation({
    super.key,
    required this.timestamp,
    required this.location,
  });

  // Method to format the date from a timestamp.
  String formatedDate() {
    // Convert timestamp to DateTime.
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);

    // Format the DateTime object.
    String formattedDate = DateFormat('EEEE, MMM d').format(date);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: appDefaultPadding / 2, // Padding at the top.
        left: appDefaultPadding, // Padding on the left.
        right: appDefaultPadding, // Padding on the right.
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between elements in the row.
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the formatted date.
              Text(
                formatedDate(),
                style: textStyle12(color: Colors.black54),
              ),
              const SizedBox(height: appDefaultPadding / 4), // Spacing between elements.
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Icon for the location.
                  const Icon(
                    Iconsax.location5,
                    size: 16,
                  ),
                  const SizedBox(width: appDefaultPadding / 10), // Spacing between icon and text.
                  // Display the location name.
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
          // Circle avatar with a refresh icon.
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
