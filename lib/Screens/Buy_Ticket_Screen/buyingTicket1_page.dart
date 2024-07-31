import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:metro/Screens/Ticket_Price/TicketsPrice.dart';
import 'package:metro/models/ticket_model.dart';
import 'package:metro/services/buy_ticket_service.dart';
import 'package:metro/widgets/BuyTicket_widget.dart';
import 'package:metro/widgets/backIcon.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class BuyingTicket1 extends StatefulWidget {
  const BuyingTicket1({Key? key}) : super(key: key);

  @override
  State<BuyingTicket1> createState() => _BuyingTicket1State();
}

class _BuyingTicket1State extends State<BuyingTicket1> {
  int yellowPrice = 6;
  int greenPrice = 8;
  int redPrice = 12;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const backIcon(),
              const SizedBox(height: 20),
              const Text(
                "Buy Metro Tickets",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              BuyTicket(
                color: const Color(0xffFCFC4F),
                textColor: Colors.black,
                stationsNumber: '9',
                price: yellowPrice,
                ticketName: 'Yellow',
                onPressed: () => showAlertDialog(() async {
                  setState(() {
                    isLoading = true;
                  });

                  try {
                    await BuyTicketService(context: context, price: yellowPrice)
                        .buyTicket(ticketModel: TicketModel());

                    Navigator.pop(context);

                    setState(() {
                      isLoading = false;
                    });
                  } on Exception {
                    Fluttertoast.showToast(
                      msg: 'There is an Error, Please try again!',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.white,
                      textColor: Colors.green,
                      fontSize: 16.0,
                    );
                  }
                  setState(() {
                    isLoading = false;
                  });
                }),
              ),
              const SizedBox(height: 30),
              BuyTicket(
                color: const Color(0xff31F480),
                textColor: Colors.black,
                stationsNumber: '16',
                price: greenPrice,
                ticketName: 'Green',
                onPressed: () => showAlertDialog(() async {
                  setState(() {
                    isLoading = true;
                  });

                  try {
                    await BuyTicketService(context: context, price: greenPrice)
                        .buyTicket(ticketModel: TicketModel());
                    Navigator.pop(context);

                    setState(() {
                      isLoading = false;
                    });
                  } on Exception {
                    Fluttertoast.showToast(
                      msg: 'There is an Error, Please try again!',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.white,
                      textColor: Colors.green,
                      fontSize: 16.0,
                    );
                  }
                  setState(() {
                    isLoading = false;
                  });
                }),
              ),
              const SizedBox(height: 30),
              BuyTicket(
                color: const Color(0xffDE2323),
                textColor: Colors.white,
                stationsNumber: '23',
                price: redPrice,
                ticketName: 'Red',
                onPressed: () => showAlertDialog(() async {
                  setState(() {
                    isLoading = true;
                  });

                  try {
                    await BuyTicketService(context: context, price: redPrice)
                        .buyTicket(ticketModel: TicketModel());
                    Navigator.pop(context);

                    setState(() {
                      isLoading = false;
                    });
                  } on Exception {
                    Fluttertoast.showToast(
                      msg: 'There is an Error, Please try again!',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.white,
                      textColor: Colors.green,
                      fontSize: 16.0,
                    );
                  }
                  setState(() {
                    isLoading = false;
                  });
                }),
              ),
              const SizedBox(height: 40),
              const Text(
                '  Don’t know number of stations or price?',
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
                    'Go to ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const TicketsPrice()),
                        ),
                      );
                    },
                    child: const Text(
                      'Tickets Price Page ',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    'and Search now',
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
      ),
    );
  }

  void showAlertDialog(VoidCallback onPressed) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.white,
              child: Container(
                height: 180,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffE5F6FE),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      const Text(
                        'Are you sure you want to ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),
                      ),
                      const Text(
                        'buy a ticket?',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),
                      ),
                      const Divider(
                        endIndent: 20,
                        indent: 20,
                        color: Colors.black,
                      ),
                      isLoading
                          ? const CircularProgressIndicator()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    onPressed();
                                  },
                                  child: const Text(
                                    'yes',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 50),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
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
            );
          },
        );
      },
    );
  }
}
