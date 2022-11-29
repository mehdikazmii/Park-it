import 'package:flutter/material.dart';
import 'package:park_it/helpers/screen_navigation.dart';
import 'package:park_it/screens/auth_screens/login_screen.dart';
import 'package:park_it/screens/bottom_navigation_screens/home_screens/home_screen.dart';

import '../../helpers/constant.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield.dart';
import '../bottom_navigation_screens/bottom_navigation_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset('assets/icon.png'),
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: 'Welcome to Parkit,',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: 'SignUp Now',
                    weight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    icon: Icons.person,
                    hint: 'Full Name',
                    label: 'Name',
                    controller: nameController),
                CustomTextField(
                    icon: Icons.email_outlined,
                    hint: 'Enter your email address',
                    label: 'Email',
                    controller: emailController),
                CustomTextField(
                    icon: Icons.lock,
                    hint: 'Enter your passsword',
                    label: 'pass',
                    controller: passwordController),
                CustomTextField(
                    icon: Icons.lock,
                    hint: 'Confirm password',
                    label: 'pass',
                    controller: confirmPassController),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  buttonName: 'Sign Up',
                  function: () =>
                      changeScreen(context, const BottomNavigationScreen()),
                  width: 300,
                  height: 45,
                  textColor: white,
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'Do not have an account?',
                      color: black,
                      size: 15,
                    ),
                    GestureDetector(
                      onTap: () => changeScreen(context, LoginScreen()),
                      child: CustomText(
                        text: '  Sign In',
                        color: red,
                        size: 16,
                        weight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
