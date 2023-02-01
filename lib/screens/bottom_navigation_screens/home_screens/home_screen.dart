import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:park_it/entity/app_user.dart';
import 'package:park_it/helpers/screen_navigation.dart';
import 'package:park_it/provider/user_provider.dart';
import 'package:park_it/screens/bottom_navigation_screens/home_screens/reservation_crad_screen.dart';
import 'package:park_it/screens/bottom_navigation_screens/home_screens/select_city_sheet.dart';
import 'package:park_it/widgets/custom_text.dart';
import '../../../helpers/constant.dart';
import '../../../widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key, required this.appUser, required this.userProvider});
  final AppUser appUser;
  final UserProvider userProvider;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    print(widget.appUser.city);
    print('=====================');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:
          Drawerr(appUser: widget.appUser, userProvider: widget.userProvider),
      appBar: AppBar(
        shadowColor: red,
        backgroundColor: red,
        title: Container(
          margin: const EdgeInsets.only(left: 70),
          child: Text(
            'Home',
            style: TextStyle(color: black),
          ),
        ),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.menu,
                color: black,
              ));
        }),
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
              CustomText(
                text: 'Welcome, ${widget.appUser.username}',
                size: 25,
                weight: FontWeight.bold,
              ),
              const Text(
                'Find your nearest parking',
                style: TextStyle(color: Color.fromARGB(255, 243, 188, 188)),
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
                          return const SelectCitySheet();
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
                text: 'My Reservation',
                weight: FontWeight.bold,
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 200,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('reservations')
                          .where("id", isEqualTo: widget.appUser.id)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container();
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container();
                        }
                        var item = snapshot.data!.docs;

                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              var data = item[index];
                              return GestureDetector(
                                onTap: () {
                                  changeScreen(
                                      context, ResevationCard(data: data));
                                },
                                child: Card(
                                  elevation: 3,
                                  child: ListTile(
                                    subtitle: Text(DateTime.parse(
                                            data['reservationTime']
                                                .toDate()
                                                .toString())
                                        .toString()),
                                    leading:
                                        const Icon(Icons.pedal_bike_outlined),
                                    trailing: Text(
                                      data['price'].toString(),
                                      style: TextStyle(
                                          color: teal,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    title: Text(data['place']),
                                  ),
                                ),
                              );
                            });
                      }))
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
