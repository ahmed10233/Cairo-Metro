// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:metro/Screens/AppHome/appHome_page.dart';
// import 'package:metro/Screens/Buy_Ticket_Screen/successfullyBooking_page.dart';
// import 'package:metro/main.dart';
// import 'package:metro/models/ticket_model.dart';
// import 'package:metro/services/buy_ticket_service.dart';
// import 'package:metro/widgets/backIcon.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// class BuyingTicket extends StatefulWidget {
//   const BuyingTicket({
//     Key? key,
//     required this.ticketPrice,
//   }) : super(key: key);
//   final int ticketPrice;
//   @override
//   BuyingTicketState createState() => BuyingTicketState();
// }

// class BuyingTicketState extends State<BuyingTicket> {
//   int? userBalance;

//   @override
//   void initState() {
//     super.initState();
//     getBalace();
//   }

//   void getBalace() {
//     setState(() {
//       userBalance = sharedPref.getInt("accountBalance");
//     });
//   }
//   bool isLoading = false;
//   bool showNoEnoughBalance = false;
//   bool showEnoughBalance = false;

//   @override
//   Widget build(BuildContext context) {
//     return ModalProgressHUD(
//       inAsyncCall: isLoading,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(1),
//           child: AppBar(
//             backgroundColor: Colors.white,
//             elevation: 0,
//           ),
//         ),
//         body: Column(
//           children: [
//             const backIcon(), // Assuming BackIcon is a widget
//             const SizedBox(
//               height: 80,
//             ),
//             const Text(
//               "Buy Metro Tickets",
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(
//               height: 50,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 border: Border.all(color: Colors.black, width: 1),
//               ),
//               height: 340,
//               width: 330,
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 25,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         'assets/images/Registration/wallet.jpg',
//                         height: 50,
//                         width: 65,
//                       ),
//                       const Text(
//                         '  Your balance:',
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.normal,
//                             fontSize: 20),
//                       ),
//                       Text(
//                         '$userBalance EGP',
//                         style: const TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 25,
//                   ),
//                   const Text(
//                     'Ticket price is: ',
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 17),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     '${widget.ticketPrice} EGP',
//                     // Assuming each ticket = 6 EGP
//                     style: const TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 22),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       backgroundColor: const Color(0xffFFBC4F),
//                     ),
//                     onPressed: () async {
//                       setState(() {
//                       isLoading = true;
//                     });
//                       try {
      
//                         await buyTicketMethod();
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: ((context) => const AppHome()),
//                           ),
//                         );
//                         setState(() {
//                           isLoading = false;
//                         });
//                       } on Exception {
//                         Fluttertoast.showToast(
//                           msg: 'There is an Error, Please try again!',
//                           toastLength: Toast.LENGTH_LONG,
//                           gravity: ToastGravity.CENTER,
//                           backgroundColor: Colors.white,
//                           textColor: Colors.green,
//                           fontSize: 16.0,
//                         );
//                       }
//                       setState(() {
//                           isLoading = false;
//                         });
//                     },
//                     child: const Text(
//                       ' Buy',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Visibility(
//               visible: showNoEnoughBalance,
//               child: Container(
//                 height: 150,
//                 width: 340,
//                 decoration: BoxDecoration(
//                   color: const Color(0xffE5F6FE),
//                   borderRadius: BorderRadius.circular(14),
//                 ),
//                 child: Column(
//                   children: [
//                     Align(
//                       alignment: Alignment.topRight,
//                       child: IconButton(
//                         onPressed: () {
//                           setState(() {
//                             showNoEnoughBalance = false;
//                           });
//                         },
//                         icon: const Icon(
//                           Icons.backspace_outlined,
//                           size: 20,
//                         ),
//                       ),
//                     ),
//                     const Text(
//                       'Sorry your balance is not enough',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 20,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const Text(
//                       '❌❌',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Visibility(
//               visible: showEnoughBalance,
//               child: Container(
//                 height: 150,
//                 width: 340,
//                 decoration: BoxDecoration(
//                   color: const Color(0xffE5F6FE),
//                   borderRadius: BorderRadius.circular(14),
//                 ),
//                 child: Column(
//                   children: [
//                     Align(
//                       alignment: Alignment.topRight,
//                       child: IconButton(
//                         onPressed: () {
//                           setState(() {
//                             showEnoughBalance = false;
//                           });
//                         },
//                         icon: const Icon(
//                           Icons.backspace_outlined,
//                           size: 20,
//                         ),
//                       ),
//                     ),
//                     const Text(
//                       'Are you sure you want buy tickets?',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 20,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const SuccessfullyBooking(),
//                               ),
//                             );
//                           },
//                           child: const Text(
//                             '  Yes',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 20,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 50,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               showEnoughBalance = false;
//                             });
//                           },
//                           child: const Text(
//                             'no',
//                             style: TextStyle(
//                               color: Colors.red,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 20,
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   buyTicketMethod() async {
//     await BuyTicketService(context: context, price: widget.ticketPrice)
//         .buyTicket(ticketModel: TicketModel());
//   }
// }
