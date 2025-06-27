import 'dart:async';

// import 'package:car_engine_fault_detection/authentication/signup.dart';
// import 'package:car_engine_fault_detection/constants/app_colors.dart';
import 'package:car_engine_fault_detection/navigation_service/app_navigator.dart';
import 'package:car_engine_fault_detection/navigation_service/routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashTimer();
  }

  void startSplashTimer() async {
    await Future.delayed(Duration(seconds: 5));

    // Example condition
    // bool isUserLoggedIn = false; // Replace this with your actual check
    AppNavigator.pushNamed(context, Routes.signup);
    // if (isUserLoggedIn) {
    //   AppNavigator.pushNamed(context, Routes.home); // e.g., home screen route
    // } else {
    //   AppNavigator.pushNamed(context, Routes.signup); // goes to signup
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/car.png'),
              SizedBox(height: 20),
              Text(
                textAlign: TextAlign.center,
                'AI Based Car Engine\nFault Detection',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
