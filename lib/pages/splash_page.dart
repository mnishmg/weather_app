import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final nameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Image.asset('assets/images/m.png')),
            const SizedBox(height: appDefaultPadding * 2),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: appDefaultPadding),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Before we get Started',
                      style: textStyle16(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: appDefaultPadding),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      label: Text(
                        'Please Enter Your Name',
                        style: textStyle12(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      helperText:
                          'You can also continue without entering your name.',
                      helperStyle: textStyle12(
                          color: Colors.red, fontWeight: FontWeight.w500),
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.7)),
                    ),
                  ),
                  const SizedBox(height: appDefaultPadding * 1.5),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              vertical: appDefaultPadding / 1.5,
                              horizontal: appDefaultPadding * 2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  appDefaultPadding * 1.5))),
                      child: Text(
                        'Continue',
                        style: textStyle16(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      )),
                  const SizedBox(height: appDefaultPadding),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
