import 'package:flutter/material.dart';
import 'package:park_it/widgets/custom_text.dart';

import '../../../helpers/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: white,
        backgroundColor: white,
        title: Container(
          margin: const EdgeInsets.only(left: 70),
          child: Text(
            'Home',
            style: TextStyle(color: black),
          ),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: black,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: black,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const CustomText(
                text: 'Welcome Back, Richard',
                size: 25,
                weight: FontWeight.bold,
              ),
              const Text(
                'Find your nearest parking',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.change_circle,
                        color: teal,
                        size: 38,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: (() {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const Text('Modal BottomSheet'),
                                    ElevatedButton(
                                      child: const Text('Close BottomSheet'),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey)),
                      child: const Text(
                        'Select city',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey)),
                    child: const Text(
                      'Near you',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: 'Explore Best Parking',
                weight: FontWeight.bold,
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: const [
                  localCard(),
                  localCard(),
                  localCard(),
                  localCard(),
                  localCard(),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: 'Previous Parking',
                weight: FontWeight.bold,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 200,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 3,
                        child: ListTile(
                          subtitle: const Text('9 july, 2021'),
                          leading: const Icon(Icons.pedal_bike_outlined),
                          trailing: Text(
                            "Rs 500",
                            style: TextStyle(
                                color: teal,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          title: const Text("Blue parking"),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class localCard extends StatelessWidget {
  const localCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/map.png',
            ),
          ),
          const CustomText(
            text: 'Emporium Mall',
            weight: FontWeight.bold,
            size: 13,
          ),
          const CustomText(
            text: 'johar town, j block',
            weight: FontWeight.bold,
            size: 11,
            color: Colors.grey,
          ),
          CustomText(
            text: '11:00 am - 1:00 pm',
            weight: FontWeight.bold,
            size: 12,
            color: teal,
          ),
        ],
      ),
    );
  }
}
