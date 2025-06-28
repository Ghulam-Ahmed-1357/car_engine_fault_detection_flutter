// import 'package:car_engine_fault_detection/authentication/login.dart';
import 'package:car_engine_fault_detection/constants/app_colors.dart';
// import 'package:car_engine_fault_detection/navigation_service/app_navigator.dart';
// import 'package:car_engine_fault_detection/navigation_service/routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double fuelPercentage = 20;

  TextStyle textStyle(double size) {
    return TextStyle(
      color: Colors.white,
      fontSize: size,
      fontWeight: FontWeight.w500,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'MAGNITE XV PREMIUM',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(child: Image.asset('assets/images/car.png')),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 160,
                      width: size.width * 0.42,
                      decoration: BoxDecoration(
                        color: AppColors.containerColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Text("Fuel tank", style: textStyle(18)),
                                SizedBox(height: 10),
                                Text(
                                  "${fuelPercentage.toInt()}%",
                                  style: textStyle(30),
                                ),
                              ],
                            ),
                          ),

                          Align(
                            alignment: Alignment.bottomLeft,
                            child: FractionallySizedBox(
                              widthFactor: 1.0,
                              heightFactor: 0.3,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(24),
                                    bottomRight: Radius.circular(24),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.bottomLeft,
                            child: FractionallySizedBox(
                              widthFactor: fuelPercentage / 100,
                              heightFactor: 0.3,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(24),
                                    bottomRight: Radius.circular(
                                      fuelPercentage == 100 ? 24 : 0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 160,
                      width: size.width * 0.42,
                      decoration: BoxDecoration(
                        color: AppColors.containerColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: Column(
                          spacing: 2,
                          children: [
                            SizedBox(height: 10),
                            Text('Climate', style: textStyle(16)),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 4,
                                ),
                                child: Text('A/C is on', style: textStyle(16)),
                              ),
                            ),
                            // SizedBox(height: 10),
                            Text('19°C', style: textStyle(30)),
                            // SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 4,
                                ),
                                child: Text(
                                  'Outside 24°C',
                                  style: textStyle(16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 70,
                      width: size.width * 0.42,
                      decoration: BoxDecoration(
                        color: AppColors.containerColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: Text('CamShaft\nPiston', style: textStyle(16)),
                      ),
                    ),

                    Container(
                      height: 70,
                      width: size.width * 0.42,
                      decoration: BoxDecoration(
                        color: AppColors.containerColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: Text(
                          'CranShaft\nEngineBlock',
                          style: textStyle(16),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  height: 70,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: AppColors.containerColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Cylinderhead\nConnectingRod',
                          style: textStyle(16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Row(
                          children: [
                            Image.asset('assets/images/petrol_pump.png'),
                            SizedBox(width: 15),
                            Text(
                              'IgnitionSys\nCoolingSys',
                              style: textStyle(16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 110,
                      width: size.width * 0.42,
                      decoration: BoxDecoration(
                        color: AppColors.containerColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Smart Drive Score', style: textStyle(16)),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: Row(
                                children: [
                                  Image.asset('assets/images/star.png'),
                                  SizedBox(width: 15),
                                  Text('70%', style: textStyle(30)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      height: 110,
                      width: size.width * 0.42,
                      decoration: BoxDecoration(
                        color: AppColors.containerColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Last Trip', style: textStyle(16)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('11.9', style: textStyle(30)),
                                SizedBox(width: 12),
                                Text('KM', style: textStyle(20)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
