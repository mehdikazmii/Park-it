import 'package:flutter/material.dart';
import 'package:park_it/helpers/screen_navigation.dart';
import 'package:park_it/screens/auth_screens/signup_screen.dart';
import 'package:park_it/screens/bottom_navigation_screens/bottom_navigation_screen.dart';
import 'package:park_it/screens/bottom_navigation_screens/home_screens/home_screen.dart';
import '../../helpers/constant.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
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
                  height: 30,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: 'Welcome Back,',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: 'SignIn Now',
                    weight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
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
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: 'Forget Password?',
                    color: red,
                    size: 15,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  buttonName: 'Sign In',
                  function: () =>
                      changeScreen(context, const BottomNavigationScreen()),
                  width: 300,
                  height: 45,
                  textColor: white,
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'Already have an Account?',
                      color: black,
                      size: 15,
                    ),
                    GestureDetector(
                      onTap: () => changeScreen(context, RegisterScreen()),
                      child: CustomText(
                        text: '  Sign Up',
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
