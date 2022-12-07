// ignore_for_file: avoid_print
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:park_it/screens/bottom_navigation_screens/home_screens/home_screen.dart';
import 'package:park_it/screens/bottom_navigation_screens/info_screens/info_screens.dart';
import 'package:park_it/screens/bottom_navigation_screens/map_screens/map_screen.dart';
import 'package:park_it/screens/bottom_navigation_screens/profile_screens/profile_screen.dart';
import 'package:provider/provider.dart';
import '../../entity/app_user.dart';
import '../../helpers/constant.dart';
import '../../provider/user_provider.dart';
import '../../widgets/custom_modal_progress_hud.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);
  static String id = 'navigaationScreenId';

  @override
  State<BottomNavigationScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomNavigationScreen> {
  final PageController controller = PageController(initialPage: 0);
  var pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> buildScreens(userProvider, appUser) {
      return [
        HomeScreen(userProvider: userProvider, appUser: appUser),
        MapScreen(appUser: appUser),
        ProfileScreen(appUser: appUser),
        InfoScreen(appUser: appUser),
      ];
    }

    return Scaffold(
        bottomNavigationBar: CustomNavigationBar(
            backgroundColor: white,
            scaleFactor: 0.2,
            scaleCurve: Curves.linear,
            bubbleCurve: Curves.linear,
            selectedColor: teal,
            strokeColor: white,
            elevation: 16,
            currentIndex: pageIndex,
            onTap: (index) {
              setState(() {
                pageIndex = index;
                controller.animateToPage(pageIndex,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.linearToEaseOut);
              });
            },
            iconSize: 29,
            unSelectedColor: Colors.grey,
            items: [
              CustomNavigationBarItem(icon: const Icon(Icons.home)),
              CustomNavigationBarItem(icon: const Icon(Icons.map_sharp)),
              CustomNavigationBarItem(icon: const Icon(Icons.person)),
              CustomNavigationBarItem(icon: const Icon(Icons.info_outlined)),
            ]),
        body: Consumer<UserProvider>(builder: (context, userProvider, child) {
          return FutureBuilder<AppUser?>(
              future: userProvider.user,
              builder: (context, userSnapshot) {
                return CustomModalProgressHUD(
                    inAsyncCall: userProvider.isLoading,
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      controller: controller,
                      onPageChanged: (index) {
                        setState(() {
                          pageIndex = index;
                        });
                      },
                      children: buildScreens(
                          userProvider,
                          userSnapshot.hasData
                              ? userSnapshot.data!
                              : AppUser(
                                  id: '',
                                  username: '',
                                  city: '',
                                  number: '',
                                  email: '')),
                    ));
              });
        }));
  }
}
