import 'dart:math';

import 'package:easy_bus_tracker/screens/bus_routes/BusRoutePage.dart';
import 'package:easy_bus_tracker/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'LoginPageController.dart';

class LoginPage extends StatelessWidget {
  final LoginPageController controller = Get.put(LoginPageController());
  final TextEditingController accountNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        leading: Icon(Icons.bus_alert_rounded),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/pic1.jpg', // Replace with your logo image path
                height: 150,
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: accountNoController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Account Number',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primaryColor, // background color
                  onPrimary: Colors.white, // text color
                  shadowColor: Colors.grey, // shadow color
                  elevation: 5, // elevation of the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // rounded corners
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // padding inside the button
                ),
                onPressed: () async {
                  bool success = await controller.login(accountNoController.text,passwordController.text);

                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('Login', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
