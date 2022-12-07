import 'package:flutter/material.dart';
import 'package:park_it/Models/user_registration.dart';
import 'package:park_it/helpers/screen_navigation.dart';
import 'package:park_it/helpers/utils.dart';
import 'package:park_it/screens/auth_screens/login_screen.dart';
import 'package:park_it/widgets/custom_modal_progress_hud.dart';
import '../../helpers/constant.dart';
import '../../provider/user_provider.dart';
import '../../remote/response.dart';
import '../../widgets/custom_button.dart';
import 'package:provider/provider.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield.dart';
import '../bottom_navigation_screens/bottom_navigation_screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  bool _isLoading = false;

  late UserProvider _userProvider;
  UserRegistration userRegistration = UserRegistration();

  @override
  void initState() {
    super.initState();
    _userProvider = Provider.of<UserProvider>(context, listen: false);
  }

  void registerUser(userRegistration, context) async {
    setState(() {
      _isLoading = true;
    });

    await _userProvider
        .registerUser(userRegistration, context)
        .then((response) {
      if (response is Success) {
        Navigator.pop(context);
        changeScreen(context, BottomNavigationScreen());
      }
    });

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomModalProgressHUD(
          inAsyncCall: _isLoading,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                    controller: nameController,
                    textInputAction: TextInputAction.next,
                  ),
                  CustomTextField(
                      icon: Icons.email_outlined,
                      hint: 'Enter your email address',
                      label: 'Email',
                      controller: emailController,
                      textInputAction: TextInputAction.next),
                  CustomTextField(
                      icon: Icons.phone,
                      hint: 'Enter your number',
                      label: 'Number',
                      controller: phoneController,
                      textInputAction: TextInputAction.next),
                  CustomTextField(
                      icon: Icons.location_city,
                      hint: 'Enter your city',
                      label: 'City',
                      controller: cityController,
                      textInputAction: TextInputAction.next),
                  CustomTextField(
                      icon: Icons.lock,
                      hint: 'Enter your passsword',
                      label: 'pass',
                      controller: passwordController,
                      textInputAction: TextInputAction.next),
                  CustomTextField(
                      icon: Icons.lock,
                      hint: 'Confirm password',
                      label: 'pass',
                      controller: confirmPassController),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    buttonName: 'Sign Up',
                    function: () {
                      userRegistration.city = cityController.text.trim();
                      userRegistration.username = nameController.text.trim();
                      userRegistration.number = phoneController.text.trim();
                      userRegistration.email = emailController.text.trim();
                      userRegistration.password =
                          passwordController.text.trim();
                      userRegistration.city.isNotEmpty &&
                              userRegistration.email.isNotEmpty &&
                              userRegistration.number.isNotEmpty &&
                              userRegistration.password.isNotEmpty &&
                              userRegistration.username.isNotEmpty
                          ? registerUser(userRegistration, context)
                          : showSnackBar('Please fill all the fields', context);
                    },
                    width: 300,
                    height: 45,
                    textColor: white,
                  ),
                  const SizedBox(
                    height: 20,
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
      ),
    );
  }
}
