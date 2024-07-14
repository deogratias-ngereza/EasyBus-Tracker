import 'dart:async';
import 'package:easy_bus_tracker/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'SplashPageController.dart';

class SplashPage extends StatelessWidget {
  //const SplashPage({Key? key}) : super(key: key);

  var c = Get.put(SplashPageController());

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      backgroundColor: Colors.white, // You can set any background color you want
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your logo or app name image
            Image.asset(
              'assets/images/pic1.jpg', // Replace 'assets/logo.png' with your image path
              width: 150, // Adjust the width and height according to your logo size
              height: 150,
            ),
            SizedBox(height: 5), // Add some spacing between logo and loading indicator
            // Loading indicator
            CircularProgressIndicator(
              color: AppColors.primaryColor, // You can set any color you want
              strokeWidth: 1,
              //value: 0,

            ),
          ],
        ),
      ),
    );
  }
}
