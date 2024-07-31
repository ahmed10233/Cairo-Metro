import 'package:flutter/material.dart';
import 'package:metro/main.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  String? fullName;
  String? userId; 
  String? qrStringSub;
  String? profileImage;
  String? endDate;
  int? numOfTrips;
  
  @override
  void initState() {
    super.initState();
    getPrice();
  }

  void getPrice() {
    setState(() {
      fullName = sharedPref.getString("fullName");
      userId = sharedPref.getString("userId");
      qrStringSub = sharedPref.getString("QrStringSub");
      profileImage = sharedPref.getString("profileImage");
      endDate = sharedPref.getString("endDate");
      numOfTrips = sharedPref.getInt("numOfTrips");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  color: const Color(0xffC01414),
                  height: 200,
                ),
                Positioned(
                  top: 120, 
                  left: MediaQuery.of(context).size.width / 2.5 - 50, 
                  child:Center(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                            
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white,
                                border: Border.all(
                                  color: const Color.fromARGB(255, 255, 255, 255),
                                  width: 6, // Adjust the width of the border
                                ),
                              ),
                              child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage('$profileImage'), // Replace with your image URL
                  ),)
                ),)),
                const Positioned(
                  top: 70,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        'My Profile',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(
                        height: 250,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(                
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xffC01414),
                          width: 6.0), 
                      borderRadius:
                          BorderRadius.circular(12.0), 
                    ),
                    child: Center(
                      child: QrImageView(
                          data: '$qrStringSub', version: QrVersions.auto,
                           size: 350),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white, 
                        border: Border.all(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            width: 1.5), 
                        borderRadius:
                            BorderRadius.circular(5),
                      ),
                      child:  Text(
                        'Number of remaining trips : $numOfTrips',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Name',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                width: 350,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white, 
                  border: Border.all(
                      color: const Color(0xffA9A9A9),
                      width: 1.5), 
                  borderRadius: BorderRadius.circular(8), 
                ),
                child:  Text(
                  '$fullName',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'User ID',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                width: 350,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  border: Border.all(
                      color: const Color(0xffA9A9A9),
                      width: 1.5), 
                  borderRadius: BorderRadius.circular(8), 
                ),
                child:  Text(
                  '$userId',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'End At',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                width: 350,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  border: Border.all(
                      color: const Color(0xffA9A9A9),
                      width: 1.5),
                  borderRadius: BorderRadius.circular(8), 
                ),
                child:  Text(
                  '$endDate',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}