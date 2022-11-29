
// import 'package:flutter/material.dart';

// import '../../helpers/constant.dart';

// class Drawerr extends StatefulWidget {
//   Drawerr({Key? key}) : super(key: key);

//   @override
//   State<Drawerr> createState() => _DrawerrState();
// }

// class _DrawerrState extends State<Drawerr> {

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//         backgroundColor: white,
//         child: ListView(
//           children: [
//             UserAccountsDrawerHeader(
//               decoration: BoxDecoration(color: yellow),
//               currentAccountPicture: CircleAvatar(
//                 // backgroundImage:
//                 //     // CachedNetworkImageProvider(widget.user!.profilePhotoPath!),
//                 // backgroundColor: Colors.grey,
//                 // radius: 40,
//               ),
//               arrowColor: Colors.white,
//               accountName: Text(
                
//                 style: TextStyle(color: black),
//               ),
//               accountEmail: Text(
//                 widget.user!.email.toString(),
//                 style: TextStyle(color: black),
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.settings_outlined),
//               title: const Text('Settings'),
//               onTap: () {
//                 changeScreen(
//                     context,
//                     SettingScreen(
//                       user: widget.user,
//                     ));
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.attach_money_outlined),
//               title: const Text('Referal Code'),
//               onTap: () {
//                 changeScreen(
//                     context, InviteScreen(referalCode: widget.user!.id));
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.exit_to_app),
//               title: const Text('Log out'),
//               onTap: () {
//                 userProvider.logoutUser();
//                 Navigator.pop(context);
//                 Navigator.pushNamed(context, LoginScreen.id);
//               },
//             )
//           ],
//         ));
//   }
// }
