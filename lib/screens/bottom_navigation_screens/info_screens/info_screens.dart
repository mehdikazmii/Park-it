import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../entity/app_user.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key, required this.appUser});
  final AppUser appUser;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
