// import 'package:flutter/material.dart';
// import 'package:metro/Screens/SignUp_Screens/Ui/SignUp_Page.dart';
// import 'package:metro/widgets/Button.dart';



// class MailExpired extends StatefulWidget {
//   const MailExpired({super.key});

//   @override
//   State<MailExpired> createState() => _MailExpiredState();
// }

// class _MailExpiredState extends State<MailExpired> {
//   @override
//   void initState() {
//     super.initState();
//     // Navigate to MailVerified after 5 seconds
//     Future.delayed(const Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const SignUp2()),
//       );
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(1),
//         child: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 30000,
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const SizedBox(
//             height: 200,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 45),
//             child: Center(child: Image.asset('assets/images/Registration/mail expired.jpg')),
//           ),
//           const Text(
//             'Your email verification link has expired',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(
//             height: 240,
//           ),
//           const Button(
//               text: 'Try again',
//               buttonColor: Color(0xffC01414),
//               page: SignUpPage()),
//         ],
//       ),
//     );
//   }
// }
