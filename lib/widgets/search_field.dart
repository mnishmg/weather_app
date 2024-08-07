import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../constants/constants.dart';

class SearchField extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback onTap;
  const SearchField(
      {super.key, required this.searchController, required this.onTap});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: appDefaultPadding,
        left: appDefaultPadding,
        right: appDefaultPadding,
      ),
      child: TextField(
        controller: searchController,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black,
          hintText: 'Enter Location...',
          hintStyle: textStyle16(color: Colors.white),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: appDefaultPadding / 2),
            child: IconButton(
                onPressed: onTap,
                icon: const Icon(
                  Iconsax.search_normal_1,
                  color: Colors.white,
                )),
          ),
          suffixIconColor: Colors.white,
          contentPadding: const EdgeInsets.only(
            left: appDefaultPadding,
            top: appDefaultPadding,
            bottom: appDefaultPadding,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(appDefaultPadding / 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(appDefaultPadding / 2),
          ),
        ),
      ),
    );
  }
}
