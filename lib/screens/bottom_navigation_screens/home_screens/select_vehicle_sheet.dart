// ignore_for_file: avoid_print

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:park_it/Models/reservation.dart';
import 'package:park_it/helpers/constant.dart';
import 'package:park_it/helpers/screen_navigation.dart';
import 'package:park_it/helpers/utils.dart';
import 'package:park_it/screens/bottom_navigation_screens/home_screens/select_slot_screen.dart';
import 'package:park_it/widgets/custom_round_button.dart';
import 'package:park_it/widgets/custom_text.dart';
import 'package:park_it/widgets/custom_textfield.dart';

class SelectVehicleSheet extends StatefulWidget {
  const SelectVehicleSheet({Key? key, required this.reservation})
      : super(key: key);
  final Reservation reservation;

  @override
  State<SelectVehicleSheet> createState() => _SelectVehicleSheetState();
}

class _SelectVehicleSheetState extends State<SelectVehicleSheet> {
  int currentValue = 1;
  int maxvalue = 22;
  int price = 300;
  int index = 0;
  TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0))),
            height: 600,
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
                const Text('1 Hour: 300-rupee'),
                index == 0
                    ? SizedBox(
                        height: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const CustomText(
                              text: 'Schedule Parking',
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DateTimePicker(
                                  icon: Icon(
                                    Icons.event,
                                    color: black,
                                  ),
                                  style: TextStyle(color: black),
                                  type: DateTimePickerType.dateTimeSeparate,
                                  firstDate: DateTime.now(),
                                  initialValue: '',
                                  lastDate: DateTime(2100),
                                  dateLabelText: 'Date',
                                  timeLabelText: "Time",
                                  cursorColor: white,
                                  onChanged: (val) {
                                    if (DateTime.parse(val).hour >= 8 &&
                                        DateTime.parse(val).hour <= 21) {
                                      widget.reservation.reservationTime =
                                          DateTime.parse(val);

                                      setState(() {
                                        maxvalue = 22 -
                                            widget.reservation.reservationTime!
                                                .hour;
                                      });
                                    } else {
                                      print('no');
                                      setState(() {
                                        widget.reservation.reservationTime =
                                            null;
                                      });
                                      showSnackBar(
                                          'Select time from 08:00 am to 10:00 pm',
                                          context);
                                    }
                                  },
                                  validator: (val) {
                                    print(val);
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: black),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: NumberPicker(
                                    selectedTextStyle:
                                        TextStyle(color: black, fontSize: 20),
                                    textStyle: TextStyle(color: black),
                                    value: currentValue,
                                    minValue: 1,
                                    maxValue: maxvalue,
                                    onChanged: (value) => setState(() {
                                      currentValue = value;
                                      if (widget.reservation.reservationTime !=
                                          null) {
                                        widget.reservation.hours = value;
                                      } else {
                                        showSnackBar(
                                            'Select reservation time please',
                                            context);
                                      }

                                      price = currentValue * 300;
                                      widget.reservation.price = price;
                                    }),
                                  ),
                                ),
                                CustomText(
                                  text: 'Total Price: ${price.toString()}',
                                )
                              ],
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: CRoundButton(
                                width: 300,
                                function: () {
                                  widget.reservation.reservationTime != null
                                      ? function()
                                      : showSnackBar(
                                          'Select date and time', context);
                                },
                                text: 'Next',
                                color: red,
                              ),
                            )
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const CustomText(
                              text: 'Vehicle Number Plate',
                            ),
                            CustomTextField(
                              controller: numberController,
                              hint: '',
                              icon: Icons.pin,
                              label: 'Number plate of vehicle',
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: CRoundButton(
                                width: 300,
                                function: () {
                                  widget.reservation.plateNumber =
                                      numberController.text.toUpperCase();
                                  print(widget.reservation.toMap());

                                  widget.reservation.reservationEndTime !=
                                              null &&
                                          widget.reservation.plateNumber != ''
                                      ? changeScreen(
                                          context,
                                          SelectSlotSCreen(
                                              reservation: widget.reservation))
                                      : showSnackBar(
                                          'Add your vehicle number plate',
                                          context);
                                },
                                text: 'Next',
                                color: red,
                              ),
                            )
                          ],
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  function() {
    widget.reservation.reservationEndTime = widget.reservation.reservationTime!
        .add(Duration(hours: widget.reservation.hours));
    print(widget.reservation.reservationTime);
    print(widget.reservation.reservationEndTime);
    setState(() {
      index = 1;
    });
  }
}
