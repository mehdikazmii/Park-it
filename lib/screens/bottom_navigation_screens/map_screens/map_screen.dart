import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../entity/app_user.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.appUser});
  final AppUser appUser;
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
