import 'package:car_engine_fault_detection/navigation_service/app_pages.dart';
import 'package:car_engine_fault_detection/navigation_service/routes.dart';
// import 'package:car_engine_fault_detection/views/home.dart';
// import 'package:car_engine_fault_detection/authentication/login.dart';
// import 'package:car_engine_fault_detection/authentication/signup.dart';
// import 'package:car_engine_fault_detection/views/home.dart';
// import 'package:car_engine_fault_detection/views/splash_screen.dart';
// import 'package:car_engine_fault_detection/views/vehicle_info.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      routes: AppPages.getRoutes(),
      // home: VehicleInfo(),
    );
  }
}
