import 'package:car_engine_fault_detection/constants/app_colors.dart';
import 'package:car_engine_fault_detection/navigation_service/app_navigator.dart';
import 'package:car_engine_fault_detection/navigation_service/routes.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  bool isObscurePass = true;

  bool isObscureConfirmPass = true;

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
                  SizedBox(height: 40),
                  Text(
                    'Register',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                  SizedBox(height: 80),
                  CustomTextField(hintText: 'Full Name'),
                  SizedBox(height: 25),
                  CustomTextField(
                    hintText: 'Email',
                    controller: emailController,
                  ),
                  SizedBox(height: 25),
                  CustomTextField(hintText: 'Phone', phone: true),
                  SizedBox(height: 25),
                  CustomTextField(
                    hintText: 'Password',
                    controller: passwordController,
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
                  SizedBox(height: 25),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    obscureText: isObscureConfirmPass,
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please fill all the fields";
                      }
                      if (confirmPasswordController.text !=
                          passwordController.text) {
                        return "Password do not match";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.purple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: AppColors.purple),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscureConfirmPass = !isObscureConfirmPass;
                          });
                        },
                        icon: Icon(
                          isObscureConfirmPass
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 50),
                  InkWell(
                    onTap: () {
                      bool isValid = formkey.currentState!.validate();
                      if (isValid) {
                        AppNavigator.pushNamed(context, Routes.login);
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
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  InkWell(
                    child: Text(
                      "Already have an account? Login",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    onTap: () {
                      AppNavigator.pushNamed(context, Routes.login);
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

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool? password;
  final bool? isObscure;
  final VoidCallback? iconPressed;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final bool? phone;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.password,
    this.isObscure,
    this.iconPressed,
    this.suffixIcon,
    this.controller,
    this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: phone ?? false ? TextInputType.numberWithOptions() : null,
      style: TextStyle(color: Colors.white),
      controller: controller,
      obscureText: isObscure ?? false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please fill all the fields";
        }
        if (password ?? false) {
          if (controller!.text.length < 6) {
            return "Password must be 6 characters long";
          }
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.purple),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.purple),
        ),
        suffixIcon: (password ?? false)
            ? IconButton(
                onPressed: iconPressed,
                icon: Icon(suffixIcon, color: Colors.white),
              )
            : null,
      ),
    );
  }
}
