import 'package:flutter/material.dart';

import '../helpers/constant.dart';
import '../helpers/screen_navigation.dart';
import '../helpers/shared_preferences_utils.dart';
import '../provider/user_provider.dart';
import 'auth_screens/login_screen.dart';
import 'bottom_navigation_screens/bottom_navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';

  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserProvider userProvider = UserProvider();
  @override
  void initState() {
    super.initState();
    checkIfUserExists();
  }

  Future<void> checkIfUserExists() async {
    String? userId = await SharedPreferencesUtil.getUserId();
    Navigator.pop(context);
    if (userId != null) {
      changeScreen(context, const BottomNavigationScreen());
    } else {
      changeScreen(context, LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Center(
          child: CircularProgressIndicator(
            value: 5,
            color: grey,
          ),
        ),
      ),
    );
  }
}
