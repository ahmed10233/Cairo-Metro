import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:metro/Screens/AppHome/Map_screen.dart';
import 'package:metro/Screens/AppHome/Wallet_page.dart';
import 'package:metro/Screens/GetStartedAndSplash/Ui/GetStarted&Splash.dart';
import 'package:metro/Screens/My_Ticket/myTicket.dart';
import 'package:metro/Screens/Subscriptions/subscription.dart';
import 'package:metro/Screens/Ticket_Price/TicketsPrice.dart';
import 'package:metro/main.dart';
import 'package:metro/models/show_num_ticket_model.dart';
import 'package:metro/models/user_model.dart';
import 'package:metro/services/show_num_tiket_service.dart';
import 'package:metro/widgets/BuyYourTicket_widget.dart';
import 'package:metro/widgets/IconHome_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../services/get_user_balance.dart';

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);
  static String id= 'AppHome';

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int _selectedIndex = 0;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();

    selectIndex();
  }

  void selectIndex() {
    setState(() {
      _selectedIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: AppBar(
              automaticallyImplyLeading: false,
              // actions: [
              //   IconButton(
              //       onPressed: () {
              //         sharedPref.clear();
              //         Navigator.pushReplacement(
              //           context,
              //           MaterialPageRoute(
              //             builder: ((context) => const GetStarted()),
              //           ),
              //         );
              //       },
              //       color: Colors.black,
              //       icon: const Icon(Icons.exit_to_app))
              // ],
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              elevation: 0,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Center(child: BuyYourTicket()),
                const SizedBox(
                  height: 50,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconHome(
                      iconText: 'Metro map',
                      iconImage: 'assets/images/Home/map.png',
                      page: Mapp(),
                    ),
                    IconHome(
                      iconText: 'Ticket price',
                      iconImage: 'assets/images/Home/dollar.png',
                      page: TicketsPrice(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const IconHome(
                      iconText: 'Subscriptions',
                      iconImage: 'assets/images/Home/card.png',
                      page: SubscriptioPage(),
                    ),
                    GestureDetector(
                      onTap: () {
                        handleTap();
                      },
                      child: Container(
                        height: 165,
                        width: 155,
                        decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.black),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Image(
                                image: AssetImage(
                                  'assets/images/Home/google map.png',
                                ),
                                height: 80,
                                width: 120,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                ' Nearest Station',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            height: 85,
            elevation: 0,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildIconButton(Icons.home, 0, 'Home'),
                _buildIconButton(Icons.account_balance_wallet, 1, 'Wallet'),
                _buildIconButton(CupertinoIcons.ticket_fill, 3, 'My tickets'),
                _buildIconButton(Icons.exit_to_app, 2, 'Logout'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData iconData, int index, String iconText) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            color: _selectedIndex == index
                ? const Color(0xffFFFF99)
                : Colors.white,
          ),
          child: IconButton(
            icon: Icon(iconData),
            iconSize: 23,
            color: Colors.black,
            onPressed: () async {
              setState(() {
                _selectedIndex = index;
              });

              if (index == 1) {
                setState(() {
                  isLoading = true;
                });
                try {
                  await getUserBalanceMethod();
                  setState(() {
                    isLoading = false;
                  });
                } catch (e) {
                  Fluttertoast.showToast(
                    msg: 'There is an Error, Please try again!',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                    textColor: Colors.green,
                    fontSize: 16.0,
                  );
                  setState(() {
                    isLoading = false;
                  });
                }
              } else if (index == 3) {
                setState(() {
                  isLoading = true;
                });
                try {
                  await showTicketMethod();
                  setState(() {
                    isLoading = false;
                  });
                } catch (e) {
                  Fluttertoast.showToast(
                    msg: 'There is an Error, Please try again!',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                    textColor: Colors.green,
                    fontSize: 16.0,
                  );
                  setState(() {
                    isLoading = false;
                  });
                }
              } else if (index == 2) {
  sharedPref.clear();
  Navigator.of(context).pushNamedAndRemoveUntil( GetStarted.id, (Route<dynamic> route) => false);
}

            },
          ),
        ),
        Text(
          iconText,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  void showNStationDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        child: Container(
          height: 170,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xffE5F6FE),
          ),
          child: const Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Text(
                'The Nearest Station is:',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                ),
              ),
              Divider(
                endIndent: 30,
                indent: 30,
                color: Colors.black,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Al-Shohadaa  ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                      ),
                    ),
                    Icon(
                      Icons.train_rounded,
                      size: 30,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void handleTap() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
      showNStationDialog();
    });
  }

  getUserBalanceMethod() async {
    await GetUserBalanceService().user(
      userModel: UserModel(),
    );
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => const Wallet())));
  }

  showTicketMethod() async {
    await ShowNumOFTicketsService().showTiket(
      tickeModel: ShowNumOFTicketModel(),
    );
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => const MyTicketsPage(
                  p: 0,
                ))));
  }
}
