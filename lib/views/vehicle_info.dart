import 'package:car_engine_fault_detection/constants/app_colors.dart';
import 'package:car_engine_fault_detection/navigation_service/app_navigator.dart';
import 'package:car_engine_fault_detection/navigation_service/routes.dart';
import 'package:flutter/material.dart';

class VehicleInfo extends StatefulWidget {
  const VehicleInfo({super.key});

  @override
  State<VehicleInfo> createState() => _VehicleInfoState();
}

class _VehicleInfoState extends State<VehicleInfo> {
  final TextEditingController modelController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController mileageController = TextEditingController();

  List<String> makeType = ['Toyota', 'Honda', 'BMW', 'Suzuki', 'Kia'];
  List<String> engineType = ['type 1', 'type 2', 'type 3'];
  String? selectMake;
  String? selectEngineType;

  TextStyle textStyle(double size) {
    return TextStyle(
      color: Colors.white,
      fontSize: size,
      fontWeight: FontWeight.w500,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Vehicle Information', style: textStyle(24)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Enter your car details for accurate diagnosis',
                    style: textStyle(16),
                  ),
                ),
                SizedBox(height: 20),
                Text('Make', style: textStyle(16)),
                SizedBox(height: 10),
                InputDecorator(
                  decoration: InputDecoration(
                    hintText: 'Select Make',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.grey.shade600,
                      isExpanded: true,
                      value: selectMake,
                      style: textStyle(16),
                      hint: Text('Select Make', style: textStyle(16)),
                      items: makeType.map((make) {
                        return DropdownMenuItem<String>(
                          value: make,
                          child: Text(make),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectMake = value;
                        });
                      },
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Text('Model', style: textStyle(16)),
                SizedBox(height: 10),
                TextField(
                  controller: modelController,
                  style: textStyle(16),
                  decoration: InputDecoration(
                    hintText: 'e.g. Camry',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 20),
                Text('Year', style: textStyle(16)),
                SizedBox(height: 10),
                TextField(
                  controller: yearController,
                  style: textStyle(16),
                  decoration: InputDecoration(
                    hintText: '2020',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 20),
                Text('Mileage', style: textStyle(16)),
                SizedBox(height: 10),
                TextField(
                  controller: mileageController,
                  style: textStyle(16),
                  decoration: InputDecoration(
                    hintText: '50000',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 20),
                Text('Engine Type', style: textStyle(16)),
                SizedBox(height: 10),
                InputDecorator(
                  decoration: InputDecoration(
                    hintText: 'Select engine type',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.grey.shade600,
                      isExpanded: true,
                      value: selectEngineType,
                      style: textStyle(16),
                      hint: Text('Select Make', style: textStyle(16)),

                      items: engineType.map((engine) {
                        return DropdownMenuItem<String>(
                          value: engine,
                          child: Text(engine),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectEngineType = value;
                        });
                      },
                    ),
                  ),
                ),

                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: InkWell(
                    onTap: () {
                      if (selectMake == null ||
                          selectEngineType == null ||
                          modelController.text.isEmpty ||
                          yearController.text.isEmpty ||
                          mileageController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please fill all the fields'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        AppNavigator.pushNamed(context, Routes.home);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text('Continue', style: textStyle(20)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
