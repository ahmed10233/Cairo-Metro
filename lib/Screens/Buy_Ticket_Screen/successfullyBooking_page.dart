// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:metro/Screens/My_Ticket/myTicket.dart';
// class SuccessfullyBooking extends StatelessWidget {


//   const SuccessfullyBooking({Key? key, })
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'assets/images/Home/Wallet.jpg',
//                 height: 50,
//                 width: 65,
//               ),
//               const SizedBox(width: 10), // Added SizedBox for spacing
//               Text(
//                 'Your New balance:  EGP',
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20), // Added SizedBox for spacing
//           Image.asset(
//             'assets/images/Home/succese2.jpg',
//             height: 218,
//             width: 207,
//           ),
//           const SizedBox(height: 20), // Added SizedBox for spacing
//           const Text(
//             'Tickets booked successfully',
//             style: TextStyle(
//               color: Color(0xff32B768),
//               fontWeight: FontWeight.w600,
//               fontSize: 27,
//             ),
//           ),
//            Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Go to ',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontWeight: FontWeight.normal,
//                 ),
//               ),
//                GestureDetector(
//                 onTap: (){
//                               Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: ((context) => const MyTicketsPage(p: 0,)),
//               ),
//             );
//                 },
//                  child: const Text(
//                   'My tickets ',
//                   // ignore: unnecessary_const
//                   style: const TextStyle(
//                     decoration: TextDecoration.underline,
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                                ),
//                ),
//               const Text(
//                 'to use your tickets',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontWeight: FontWeight.normal,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 30,),
//         ],
//       ),
//     );
//   }
// }
