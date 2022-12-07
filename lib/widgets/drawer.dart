import 'package:flutter/material.dart';
import 'package:park_it/entity/app_user.dart';
import 'package:park_it/provider/user_provider.dart';
import 'package:park_it/screens/auth_screens/login_screen.dart';
import 'package:park_it/screens/splash_screen.dart';

import '../../helpers/constant.dart';
import '../helpers/screen_navigation.dart';

class Drawerr extends StatefulWidget {
  Drawerr({Key? key, required this.appUser, required this.userProvider})
      : super(key: key);
  final AppUser appUser;
  final UserProvider userProvider;
  @override
  State<Drawerr> createState() => _DrawerrState();
}

class _DrawerrState extends State<Drawerr> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: white,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: teal),
              arrowColor:
                  Colors.white, // currentAccountPicture: const CircleAvatar(),
              accountName: Text(
                widget.appUser.username!,
                style: TextStyle(color: black),
              ),
              accountEmail: Text(
                widget.appUser.email.toString(),
                style: TextStyle(color: black),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Log out'),
              onTap: () {
                Navigator.pop(context);
                changeScreen(context, LoginScreen());
                widget.userProvider.logoutUser();
              },
            )
          ],
        ));
  }
}
