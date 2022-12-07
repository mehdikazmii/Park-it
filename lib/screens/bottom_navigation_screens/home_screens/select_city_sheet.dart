import 'package:flutter/material.dart';
import 'package:park_it/screens/bottom_navigation_screens/home_screens/select_parking_sheet.dart';
import '../../../helpers/constant.dart';
import '../../../widgets/custom_text.dart';

class SelectCitySheet extends StatelessWidget {
  const SelectCitySheet({
    Key? key,
  }) : super(key: key);

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
                    text: 'Operational cities',
                    color: white,
                  ),
                ),
              ),
              const SelectCityTile(
                city: 'Lahore',
              ),
              const SelectCityTile(
                city: 'Faisalabad',
              ),
              const SelectCityTile(
                city: 'Islamabad',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectCityTile extends StatelessWidget {
  const SelectCityTile({Key? key, required this.city}) : super(key: key);

  final String city;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SelectParkingSheet(city: city);
          },
        );
      },
      leading: const Icon(Icons.pin_drop),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 18,
      ),
      title: Text(city),
    );
  }
}
