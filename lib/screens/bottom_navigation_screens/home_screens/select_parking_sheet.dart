import 'package:flutter/material.dart';
import 'package:park_it/screens/bottom_navigation_screens/home_screens/select_vehicle_screen.dart';

import '../../../helpers/constant.dart';
import '../../../helpers/screen_navigation.dart';
import '../../../widgets/custom_text.dart';

class SelectParkingSheet extends StatelessWidget {
  const SelectParkingSheet({Key? key, required this.city}) : super(key: key);
  final String city;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0))),
        height: 500,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: teal, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: CustomText(
                      size: 16,
                      text: 'Select parking in $city',
                      color: white,
                    ),
                  )),
              if (city == 'Islamabad')
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SelectParkingTile(
                      place: 'Centaurus Mall',
                      city: city,
                    ),
                    SelectParkingTile(
                      place: 'Safa Gold Mall',
                      city: city,
                    ),
                    SelectParkingTile(
                      place: 'Giga Mall',
                      city: city,
                    ),
                  ],
                ),
              if (city == 'Faisalabad')
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SelectParkingTile(
                      place: 'Misaq ul Mall',
                      city: city,
                    ),
                    SelectParkingTile(
                      place: 'Mall of Faisalabad',
                      city: city,
                    ),
                    SelectParkingTile(
                      place: 'Al Fatah shopping Mall',
                      city: city,
                    ),
                  ],
                ),
              if (city == 'Lahore')
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SelectParkingTile(
                      place: 'Pakages Mall',
                      city: city,
                    ),
                    SelectParkingTile(
                      place: 'Emporium Mall',
                      city: city,
                    ),
                    SelectParkingTile(
                      place: 'Fortress Square mall',
                      city: city,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectParkingTile extends StatelessWidget {
  const SelectParkingTile({Key? key, required this.city, required this.place})
      : super(key: key);
  final String city;
  final String place;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () =>
          changeScreen(context, SelectVehicleScreen(city: city, place: place)),
      title: Text(place),
      leading: const Icon(Icons.pin_drop),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 18,
      ),
    );
  }
}
