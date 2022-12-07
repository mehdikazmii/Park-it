import 'package:flutter/material.dart';
import 'package:park_it/Models/reservation.dart';
import 'package:park_it/helpers/constant.dart';
import 'package:park_it/screens/bottom_navigation_screens/home_screens/select_vehicle_sheet.dart';
import 'package:park_it/widgets/custom_round_button.dart';
import 'package:park_it/widgets/custom_text.dart';

class SelectVehicleScreen extends StatefulWidget {
  const SelectVehicleScreen(
      {super.key, required this.city, required this.place});
  final String city;
  final String place;

  @override
  State<SelectVehicleScreen> createState() => _SelectVehicleScreenState();
}

class _SelectVehicleScreenState extends State<SelectVehicleScreen> {
  Reservation reservation = Reservation();
  int index = 0;
  List<String> list = ['Car', 'Scooter', 'Bicycle'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: Stack(
        children: [
          Image.asset(
            'assets/back.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: teal, borderRadius: BorderRadius.circular(10)),
            child: Text(
              widget.city,
              style: TextStyle(color: white, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CustomText(
                      text: 'Vehicle Type',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomCard(
                          function: () {
                            setState(() {
                              index = 0;
                            });
                          },
                          color: index == 0 ? red : white,
                          vehicle: 'Car',
                          icon: Icons.directions_car_filled_rounded,
                        ),
                        CustomCard(
                          function: () {
                            setState(() {
                              index = 1;
                            });
                          },
                          color: index == 1 ? red : white,
                          vehicle: 'Scooter',
                          icon: Icons.bike_scooter_rounded,
                        ),
                        CustomCard(
                          function: () {
                            setState(() {
                              index = 2;
                            });
                          },
                          color: index == 2 ? red : white,
                          vehicle: 'Bicycle',
                          icon: Icons.pedal_bike,
                        ),
                      ],
                    ),
                    CRoundButton(
                      function: (() {
                        reservation.city = widget.city;
                        reservation.place = widget.place;
                        reservation.vehicle = list[index];
                        print(reservation.toMap());
                        showModalBottomSheet(
                          constraints: const BoxConstraints(
                            maxHeight: 600,
                          ),
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return SelectVehicleSheet(reservation: reservation);
                          },
                        );
                      }),
                      text: 'Next',
                      width: 300,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class CustomCard extends StatelessWidget {
  CustomCard(
      {Key? key,
      required this.icon,
      required this.vehicle,
      required this.color,
      required this.function})
      : super(key: key);
  final IconData icon;
  final String vehicle;
  final Color color;
  Function function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: Card(
          elevation: 5,
          child: Container(
            height: 90,
            width: 80,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color:
                            color == red ? white : Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(icon)),
                Text(
                  vehicle,
                  style: TextStyle(
                      fontSize: 14, color: color == red ? white : black),
                ),
              ],
            ),
          )),
    );
  }
}
