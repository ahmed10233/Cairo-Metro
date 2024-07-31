import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:metro/Screens/Buy_Ticket_Screen/buyingTicket1_page.dart';
import 'package:metro/Screens/My_Ticket/Qr_page.dart';
import 'package:metro/main.dart';
import 'package:metro/models/get_ticket_model.dart';
import 'package:metro/services/get_ticket_service.dart';
import 'package:metro/widgets/buttomBar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class MyTicketsPage extends StatefulWidget {
  const MyTicketsPage({Key? key, required this.p}) : super(key: key);

  final int p;
  @override
  State<MyTicketsPage> createState() => _MyTicketsPageState();
}

class _MyTicketsPageState extends State<MyTicketsPage> {
  bool showAllert = false;
  bool showAllert2 = false;
  bool showAllert3 = false;
  int? avilibalYellow;
  int? avilibaleGreen;
  int? aviliableRed;
  bool isLoading = false;
  String? qrCode;

  @override
  void initState() {
    super.initState();
    getPrice();
  }

  void getPrice() {
    setState(() {
      avilibalYellow = sharedPref.getInt("countPrice6");
      avilibaleGreen = sharedPref.getInt("countPrice8");
      aviliableRed = sharedPref.getInt("countPrice12");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const ButtomBar(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "My Tickets:",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 350,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffFCFC4F),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(28),
                              topLeft: Radius.circular(28),
                            ),
                          ),
                          width: 26,
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Yellow Ticket',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                fixedSize: const Size(160, 35),
                                backgroundColor: const Color(0xffFCFC4F),
                              ),
                              onPressed: avilibalYellow != 0
                                  ? () {
                                      setState(() {
                                        showAllert = true;
                                      });
                                    }
                                  : null,
                              child: Text(
                                'Use Ticket ',
                                style: TextStyle(
                                  color: avilibalYellow != 0
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffFCFC4F),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(28),
                              bottomRight: Radius.circular(28),
                              topRight: Radius.circular(28),
                            ),
                          ),
                          width: 117,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'You have',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 25),
                              ),
                              Text(
                                "$avilibalYellow",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32),
                              ),
                              const Text(
                                'Tickets',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 350,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff31F480),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(28),
                              topLeft: Radius.circular(28),
                            ),
                          ),
                          width: 26,
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Green Ticket',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                fixedSize: const Size(160, 35),
                                backgroundColor: const Color(0xff31F480),
                              ),
                              onPressed: avilibaleGreen != 0
                                  ? () {
                                      setState(() {
                                        showAllert2 = true;
                                      });
                                    }
                                  : null,
                              child: Text(
                                'Use Ticket ',
                                style: TextStyle(
                                  color: avilibaleGreen != 0
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff31F480),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(28),
                              bottomRight: Radius.circular(28),
                              topRight: Radius.circular(28),
                            ),
                          ),
                          width: 117,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'You have',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 25),
                              ),
                              Text(
                                "$avilibaleGreen",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32),
                              ),
                              const Text(
                                'Tickets',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 350,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffDE2323),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(28),
                              topLeft: Radius.circular(28),
                            ),
                          ),
                          width: 26,
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Red Ticket',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                fixedSize: const Size(160, 35),
                                backgroundColor: const Color(0xffDE2323),
                              ),
                              onPressed: aviliableRed != 0
                                  ? () {
                                      setState(() {
                                        showAllert3 = true;
                                      });
                                    }
                                  : null,
                              child: const Text(
                                'Use Ticket ',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffDE2323),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(28),
                              bottomRight: Radius.circular(28),
                              topRight: Radius.circular(28),
                            ),
                          ),
                          width: 117,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'You have',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 25),
                              ),
                              Text(
                                "$aviliableRed",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32),
                              ),
                              const Text(
                                'Tickets',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Don’t have any tickets?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Go to  ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const BuyingTicket1()),
                            ),
                          );
                        },
                        child: const Text(
                          'Buying Ticket Page',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'and buy now',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              left: MediaQuery.of(context).size.width * 0.5 - 185,
              child: Visibility(
                visible: showAllert,
                child: Container(
                  height: 300,
                  width: 370,
                  decoration: BoxDecoration(
                    color: const Color(0xffE5F6FE),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              showAllert = false;
                            });
                          },
                          icon: const Icon(
                            Icons.backspace_outlined,
                            size: 25,
                          ),
                        ),
                      ),
                      const Text(
                        'Yellow Ticket',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Center(
                        child: Text(
                          'Qr code will be valid for one trip',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const Text(
                        '__________________________________________',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'You want to generate QR now?',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const Text(
                        '__________________________________________',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (avilibalYellow != 0) {
                                setState(() {
                                  showAllert = false;
                                });
                                setState(() {
                                  isLoading = true;
                                });
                                try {
                                  await getTicketMethod(6);
                                  setState(() {
                                    isLoading = false;
                                  });
                                } catch (e) {
                                  Fluttertoast.showToast(
                                    msg: 'There is an Error, Please try again!',
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor:
                                        const Color.fromARGB(255, 255, 0, 0),
                                    textColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    fontSize: 16.0,
                                  );
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              } else {
                                setState(() {
                                  showAllert = false;
                                });
                                Fluttertoast.showToast(
                                  msg: 'Don\'t Have Tickets',
                                );
                              }
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showAllert = false;
                              });
                            },
                            child: const Text(
                              'no',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              left: MediaQuery.of(context).size.width * 0.5 - 185,
              child: Visibility(
                visible: showAllert2,
                child: Container(
                  height: 300,
                  width: 370,
                  decoration: BoxDecoration(
                    color: const Color(0xffE5F6FE),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              showAllert2 = false;
                            });
                          },
                          icon: const Icon(
                            Icons.backspace_outlined,
                            size: 25,
                          ),
                        ),
                      ),
                       const Text(
                        'Green Ticket',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Center(
                        child: Text(
                          'Qr code will be valid for one trip',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const Text(
                        '__________________________________________',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'You want to generate QR now?',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const Text(
                        '__________________________________________',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (avilibaleGreen != 0) {
                                setState(() {
                                  showAllert2 = false;
                                });
                                setState(() {
                                  isLoading = true;
                                });
                                try {
                                  await getTicketMethod(8);
                                  setState(() {
                                    isLoading = false;
                                  });
                                } catch (e) {
                                  Fluttertoast.showToast(
                                    msg: 'There is an Error, Please try again!',
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor:
                                        const Color.fromARGB(255, 255, 0, 0),
                                    textColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    fontSize: 16.0,
                                  );
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              } else {
                                setState(() {
                                  showAllert2 = false;
                                });
                                Fluttertoast.showToast(
                                  msg: 'Don\'t Have Tickets',
                                );
                              }
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                           ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showAllert2 = false;
                              });
                            },
                            child: const Text(
                              'no',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              left: MediaQuery.of(context).size.width * 0.5 - 185,
              child: Visibility(
                visible: showAllert3,
                child: Container(
                  height: 300,
                  width: 370,
                  decoration: BoxDecoration(
                    color: const Color(0xffE5F6FE),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              showAllert3 = false;
                            });
                          },
                          icon: const Icon(
                            Icons.backspace_outlined,
                            size: 25,
                          ),
                        ),
                      ),
                       const Text(
                        'Red Ticket',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Center(
                        child: Text(
                          'Qr code will be valid for one trip',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const Text(
                        '__________________________________________',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'You want to generate QR now?',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const Text(
                        '__________________________________________',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (aviliableRed != 0) {
                                setState(() {
                                  showAllert3 = false;
                                });
                                setState(() {
                                  isLoading = true;
                                });
                                try {
                                  await getTicketMethod(12);
                                  setState(() {
                                    isLoading = false;
                                  });
                                } catch (e) {
                                  Fluttertoast.showToast(
                                    msg: 'There is an Error, Please try again!',
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor:
                                        const Color.fromARGB(255, 255, 0, 0),
                                    textColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    fontSize: 16.0,
                                  );
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              } else {
                                setState(() {
                                  showAllert3 = false;
                                });

                                Fluttertoast.showToast(
                                  msg: 'Don\'t Have Tickets',
                                );
                              }
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showAllert3 = false;
                              });
                            },
                            child: const Text(
                              'no',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getTicketMethod(int p) async {
    await GetTicketService(price: p).getTicket(
      getTiketmodel: GetTicketModel(),
    );
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => const QrCodePage())));
  }
}
