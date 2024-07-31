
import 'package:flutter/material.dart';
import 'package:metro/main.dart';
import 'package:qr_flutter/qr_flutter.dart';
class QrCodePage extends StatefulWidget {
  const QrCodePage({Key? key}) : super(key: key);

  @override
  QrCodePageState createState() => QrCodePageState();
}

class QrCodePageState extends State<QrCodePage> {
  String? qrCode;

  @override
  void initState() {
    super.initState();
    getQrCode();
  }

  void getQrCode() {
    setState(() {
      qrCode = sharedPref.getString("Qrcode");
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true; // Allow back navigation
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Column(
                children: [
                  Text(
                    'Scan QR with the cam ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xffC01414),
                    ),
                  ),
                  Center(
                    child: Text(
                      ' to open the gate',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xffC01414),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffC01414),
                    width: 6.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                  child: QrImageView(
                    data: '$qrCode',
                    version: QrVersions.auto,
                    size: 350.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              const SizedBox(
                height: 50,
              ),
              // const Button(
              //   text: 'Back To Home',
              //   page:AppHome(),
              //   buttonColor:Color(0xff4280EF) ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:metro/main.dart';
// import 'dart:async';

// import 'package:qr_flutter/qr_flutter.dart';

// class QrCodePage extends StatefulWidget {
//  const QrCodePage({Key? key,}) : super(key: key);


//   @override
//   QrCodePageState createState() => QrCodePageState();
// }

// class QrCodePageState extends State<QrCodePage> {
//   late Timer _timer;
//   int _secondsRemaining = 60; // 2 hours in seconds
//   bool _showImage = true;
//    String? qrCode;

//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//     getQrCode();
//   }

//   void getQrCode() {
//     setState(() {
//       qrCode = sharedPref.getString("Qrcode");
//     });
//   }


//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   void startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_secondsRemaining > 0) {
//           _secondsRemaining--;
//         } else {
//           _timer.cancel();
//           _showImage = false; // Hide the image when the timer ends
//         }
//       });
//     });
//   }

//   String getFormattedTime(int seconds) {
//     int hours = seconds ~/ 3600;
//     int minutes = (seconds % 3600) ~/ 60;
//     int remainingSeconds = seconds % 60;

//     return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     // ignore: deprecated_member_use
//     return WillPopScope(
//       onWillPop: () async {
//         // Allow back navigation only when _secondsRemaining is 0
//         return _secondsRemaining == 0;
//       },
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
             
//               _showImage
//                   ? const Column(
//                       children: [
                      
//                         Text(
//                           'Scan QR with the cam ',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 24,
//                             color: Color(0xffC01414),
//                           ),
//                         ),
//                         Center(
//                           child: Text(
//                             ' to open the gate',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 24,
//                               color:  Color(0xffC01414),
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   : Container(),
//               const SizedBox(
//                 height: 40,
//               ),
//               _showImage
//                   ?  Container(
//                     width: 350,
//                     height: 350,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                           color: const Color(0xffC01414),
//                           width: 6.0), 
//                       borderRadius:
//                           BorderRadius.circular(12.0), 
//                     ),
//                     child:  Center(
//                       child: QrImageView(
//                             data: '$qrCode',
//                             version: QrVersions.auto,
//                             size: 350.0,),
//                     ),
//                     )
//                   : const Text(
//                       'Your Ticket time has expired',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 23,
//                         color: Color(0xffC01414),
//                       ),
//                     ), // Use Container with no child to hide the image
//               const SizedBox(
//                 height: 80,
//               ),
//               Text(
//                 'Time Remaining: ${getFormattedTime(_secondsRemaining)}',
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25,
//                 ),
//               ),
              

//               const SizedBox(
//                 height: 50,
//               ),


//               // const Button(
//               //   text: 'Back To Home',
//               //   page:AppHome(),
//               //   buttonColor:Color(0xff4280EF) ),


//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
