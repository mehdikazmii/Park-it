import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:park_it/Models/reservation.dart';
import 'package:park_it/helpers/constant.dart';
import 'package:park_it/helpers/screen_navigation.dart';
import 'package:park_it/helpers/utils.dart';
import 'package:park_it/screens/bottom_navigation_screens/home_screens/reservation_summary_screen.dart';

class SelectSlotSCreen extends StatefulWidget {
  const SelectSlotSCreen({super.key, required this.reservation});
  final Reservation reservation;

  @override
  State<SelectSlotSCreen> createState() => _SelectSlotSCreenState();
}

class _SelectSlotSCreenState extends State<SelectSlotSCreen> {
  int? selected;
  // List<Map<String, dynamic>> maps = [];
  List<int> indexes = [];
  @override
  void initState() {
    function();
    super.initState();
  }

  function() async {
    // QuerySnapshot<Map<String, dynamic>> data =
    await FirebaseFirestore.instance
        .collection('reservations')
        .where('place', isEqualTo: widget.reservation.place)
        .get()
        .then((value) {
      for (var element in value.docs) {
        print('Mehdi data is here');
        print(element.data());
        DateTime startTime =
            DateTime.parse(element['reservationTime'].toDate().toString());
        print(startTime);
        DateTime endTime =
            DateTime.parse(element['reservationEndTime'].toDate().toString());
        print(endTime);
        widget.reservation.reservationTime!.isAfter(startTime) &&
                widget.reservation.reservationTime!.isBefore(endTime)
            ? indexes.add(int.parse(element['slotNumber']) - 1)
            : null;
        print('-----loop----');
      }
    });

    setState(() {});
    print('------indexes-----');
    print(indexes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        shadowColor: white,
        backgroundColor: white,
        title: Text(
          'Choose slot',
          style: TextStyle(color: black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                widget.reservation.slotNumber != ''
                    ? changeScreen(
                        context,
                        ReservationSummaryScreen(
                            reservation: widget.reservation))
                    : showSnackBar('Select slot', context);

                print(widget.reservation.toMap());
              },
              icon: Icon(
                Icons.done_outline_rounded,
                color: black,
              ))
        ],
      ),
      body: SafeArea(
          child: GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 130, crossAxisSpacing: 45),
        itemBuilder: (BuildContext context, int index) {
          return !indexes.contains(index)
              ? ParkingSlot(
                  reservation: widget.reservation,
                  index: index,
                  color: index == selected ? Colors.green : white,
                  function: () {
                    setState(() {
                      selected = index;
                      widget.reservation.slotNumber = (index + 1).toString();
                    });
                  },
                )
              : ParkingSlot(
                  reservation: widget.reservation,
                  index: index,
                  color: red,
                  function: () {},
                );
        },
      )),
    );
  }
}

class ParkingSlot extends StatefulWidget {
  const ParkingSlot(
      {Key? key,
      required this.reservation,
      required this.index,
      required this.function,
      required this.color})
      : super(key: key);

  final Reservation reservation;
  final int index;
  final Function function;
  final Color color;

  @override
  State<ParkingSlot> createState() => _ParkingSlotState();
}

class _ParkingSlotState extends State<ParkingSlot> {
  // bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.function();
      },
      child: Container(
        decoration: BoxDecoration(
            border: widget.index.isEven
                ? const Border(
                    top: BorderSide(width: 2, color: Colors.grey),
                    right: BorderSide.none,
                    bottom: BorderSide(width: 2, color: Colors.grey),
                    left: BorderSide(width: 2, color: Colors.grey),
                  )
                : const Border(
                    top: BorderSide(width: 2, color: Colors.grey),
                    right: BorderSide(width: 2, color: Colors.grey),
                    bottom: BorderSide(width: 2, color: Colors.grey),
                    left: BorderSide.none,
                  )),
        transform: widget.index.isOdd
            ? Matrix4.rotationZ(-0.2)
            : Matrix4.rotationZ(0.2),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        child: Container(
          color: widget.color,
          child: Center(
              child: Text(
            'Slot ${widget.index + 1}',
            style: TextStyle(color: black),
          )),
        ),
      ),
    );
  }
}
