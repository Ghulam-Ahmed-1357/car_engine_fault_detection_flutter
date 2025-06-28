import 'package:car_engine_fault_detection/navigation_service/routes.dart';
import 'package:car_engine_fault_detection/views/connect_screen.dart';
import 'package:car_engine_fault_detection/views/home.dart';
import 'package:car_engine_fault_detection/views/splash_screen.dart';
import 'package:car_engine_fault_detection/views/vehicle_info.dart';
import 'package:flutter/material.dart';

class AppPages {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      Routes.splash: (context) => const SplashScreen(),
      Routes.connectScreen: (context) => ConnectScreen(),
      Routes.home: (context) => const HomeScreen(),
      Routes.vehicleInfo: (context) => const VehicleInfo(),
    };
  }
}
