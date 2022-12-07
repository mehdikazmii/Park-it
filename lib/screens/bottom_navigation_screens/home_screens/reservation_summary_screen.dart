import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:park_it/Models/reservation.dart';
import 'package:park_it/helpers/screen_navigation.dart';
import 'package:park_it/helpers/utils.dart';
import 'package:park_it/screens/bottom_navigation_screens/bottom_navigation_screen.dart';
import 'package:park_it/widgets/custom_text.dart';

import '../../../helpers/constant.dart';
import '../../../widgets/custom_modal_progress_hud.dart';
import '../../../widgets/custom_round_button.dart';

class ReservationSummaryScreen extends StatefulWidget {
  ReservationSummaryScreen({super.key, required this.reservation});
  final Reservation reservation;

  @override
  State<ReservationSummaryScreen> createState() =>
      _ReservationSummaryScreenState();
}

class _ReservationSummaryScreenState extends State<ReservationSummaryScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final FirebaseFirestore instance = FirebaseFirestore.instance;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reservation summary',
          style: TextStyle(color: black),
        ),
        shadowColor: white,
        backgroundColor: white,
      ),
      body: SafeArea(
          child: CustomModalProgressHUD(
        inAsyncCall: isLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.reservation.place} Parking',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    '${widget.reservation.place}, ${widget.reservation.city}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: yellow,
                      ),
                      Icon(
                        Icons.star_border,
                        color: yellow,
                      ),
                      Icon(
                        Icons.star_border,
                        color: yellow,
                      ),
                      Text(
                        ' 3.0',
                        style: TextStyle(color: yellow, fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: teal.withOpacity(0.2)),
                        child: Icon(
                          Icons.pin_drop_rounded,
                          color: teal,
                          size: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('150m away')
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: teal.withOpacity(0.2)),
                        child: Icon(
                          Icons.alarm,
                          color: teal,
                          size: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('15 min')
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: teal.withOpacity(0.2)),
                        child: Icon(
                          Icons.local_parking,
                          color: teal,
                          size: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('20 spot')
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CRoundButton(
                    function: () {},
                    text: 'Call',
                    color: red,
                  ),
                  CRoundButton(
                    function: () {},
                    text: 'Direction',
                    color: red,
                  )
                ],
              ),
              Container(
                height: 250,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Slot number: ${widget.reservation.slotNumber}",
                      color: white,
                      size: 16,
                    ),
                    CustomText(
                      text:
                          "Vehicle plate number: ${widget.reservation.plateNumber}",
                      color: white,
                      size: 16,
                    ),
                    CustomText(
                      text:
                          "Reservation time: ${widget.reservation.reservationTime}",
                      color: white,
                      size: 16,
                    ),
                    CustomText(
                      text:
                          "End Time:  ${widget.reservation.reservationEndTime}",
                      color: white,
                      size: 16,
                    ),
                    CustomText(
                      text: "Duration: ${widget.reservation.hours} hours",
                      color: white,
                      size: 16,
                    ),
                    CustomText(
                      text: "Vehicle type: ${widget.reservation.vehicle}",
                      color: white,
                      size: 16,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CRoundButton(
                  width: 300,
                  function: () {
                    uploadData(context);
                  },
                  text: 'Reserve',
                  color: red,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  uploadData(context) async {
    widget.reservation.id = auth.currentUser!.uid;
    setState(() {
      isLoading = true;
    });
    try {
      await instance
          .collection('reservations')
          .doc()
          .set(widget.reservation.toMap())
          .then((value) {
        setState(() {
          isLoading = false;
        });
        changeScreen(context, const BottomNavigationScreen());
        print('Slot has been reserved');
      });
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }
}
