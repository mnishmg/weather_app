import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../constants/constants.dart'; 

class SearchField extends StatelessWidget {
  final TextEditingController searchController; // Controller for the search input field.
  final VoidCallback onTap; // Callback function for the search button.

  // Constructor for the SearchField widget.
  const SearchField({
    super.key,
    required this.searchController,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: appDefaultPadding, // Padding at the top.
        left: appDefaultPadding, // Padding on the left.
        right: appDefaultPadding, // Padding on the right.
      ),
      child: TextField(
        controller: searchController, // Set the controller for the TextField.
        style: const TextStyle(color: Colors.white), // Set the text style.
        decoration: InputDecoration(
          filled: true, // Enable background fill for the TextField.
          fillColor: Colors.black, // Set the background color to black.
          hintText: 'Enter Location...', // Hint text for the TextField.
          hintStyle: textStyle16(color: Colors.white), // Style for the hint text.
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: appDefaultPadding / 2), // Padding for the suffix icon.
            child: IconButton(
              onPressed: onTap, // Set the onTap callback function.
              icon: const Icon(
                Iconsax.search_normal_1, // Set the search icon.
                color: Colors.white,
              ),
            ),
          ),
          suffixIconColor: Colors.white, // Set the color for the suffix icon.
          contentPadding: const EdgeInsets.only(
            left: appDefaultPadding, // Padding on the left inside the TextField.
            top: appDefaultPadding, // Padding on the top inside the TextField.
            bottom: appDefaultPadding, // Padding on the bottom inside the TextField.
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(appDefaultPadding / 2), // Border radius when enabled.
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(appDefaultPadding / 2), // Border radius when focused.
          ),
        ),
      ),
    );
  }
}
