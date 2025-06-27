import 'package:car_engine_fault_detection/authentication/signup.dart';
import 'package:car_engine_fault_detection/constants/app_colors.dart';
import 'package:car_engine_fault_detection/navigation_service/app_navigator.dart';
import 'package:car_engine_fault_detection/navigation_service/routes.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isObscurePass = true;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(height: 70),
                  Text(
                    'Login',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 100),

                  CustomTextField(
                    hintText: 'Email',
                    controller: emailController,
                  ),
                  SizedBox(height: 25),

                  CustomTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    password: true,
                    isObscure: isObscurePass,
                    suffixIcon: isObscurePass
                        ? Icons.visibility
                        : Icons.visibility_off,
                    iconPressed: () {
                      setState(() {
                        isObscurePass = !isObscurePass;
                      });
                    },
                  ),

                  SizedBox(height: 50),
                  InkWell(
                    onTap: () {
                      bool isValid = formkey.currentState!.validate();
                      if (isValid) {
                        AppNavigator.pushNamed(context, Routes.home);
                      }
                    },
                    child: Container(
                      height: 50,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: AppColors.purple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  InkWell(
                    child: Text(
                      "Don`t have an account? Sign-up",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    onTap: () {
                      AppNavigator.pushNamed(context, Routes.signup);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
