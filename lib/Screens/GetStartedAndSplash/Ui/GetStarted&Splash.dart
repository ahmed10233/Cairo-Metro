import 'package:flutter/material.dart';
import 'package:metro/Screens/LogIn_Screens/Ui/Login_page.dart';
import 'package:metro/Screens/SignUp_Screens/Ui/SignUp_Page.dart';
import 'package:metro/widgets/Button.dart';
import 'package:metro/widgets/Constants.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});
   static String id = 'GetStarted';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
            'assets/images/Registration/home.jpg',
              height: 250,
            ),
            const SizedBox(
              height: 50,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Cairo Metro',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: kButtonColor,
                  ),
                ),
                Text(
                  ' Booking tickets ',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
            const Text(
              ' is easy now  ',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 70,
            ),
            const Button(
              text: 'Login',
              page: LoginPage(),
              buttonColor: Color(0xffc50000),
            ),
            const SizedBox(
              height: 30,
            ),
            const Button(
                text: 'Sign Up',
                page: SignUpPage(),
                buttonColor: Color(0xff73737C)),
          ],
        ),
      ),
    );
  }
}
