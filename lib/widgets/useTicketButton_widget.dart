// import 'package:flutter/material.dart';
// import 'package:metro/Screens/My_Ticket/Qr_page.dart';

// class UseTicketButton extends StatelessWidget {
//   const UseTicketButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     fixedSize: const Size(160, 35),
//                     backgroundColor: Colors.black
//                   ),
//                   onPressed: () {
//                    Navigator.push(
//               context,
//               MaterialPageRoute(
//                 // ignore: prefer_const_constructors
//                 builder: ((context) =>( QrCodePage())),
//               ),
//             );
//                   },
//                   child: const Text(
//                     'Use Ticket ',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize:16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 );
//   }
// }