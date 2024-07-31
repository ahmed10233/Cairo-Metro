import 'package:flutter/material.dart';
import 'package:metro/Screens/LogIn_Screens/Ui/ForgetPassword_page.dart';
import 'package:metro/Screens/LogIn_Screens/Ui/ResetPassword_page.dart';
import 'package:metro/widgets/Constants.dart';
import 'package:metro/widgets/Custom_Pop_Button.dart';
import 'package:metro/widgets/backIcon.dart';


class MailCheckPage extends StatefulWidget {
  const MailCheckPage({super.key});

  @override
  State<MailCheckPage> createState() => _MailCheckPageState();
}

class _MailCheckPageState extends State<MailCheckPage> {
  @override
  void initState() {
    super.initState();
    // Navigate to MailVerified after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ResetPasswordPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView(
          children: [
            const backIcon(),
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              'assets/images/Registration/succese.jpg',
              height: 180,
            ),
            const SizedBox(
              height: 100,
            ),
            const Center(
              child: Text(
                'Successe',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'Please check your email to create',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xff6B7280),
                ),
              ),
            ),
            const Center(
              child: Text(
                ' a new password',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xff6B7280),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Can\'t get email? ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xff6B7280),
                    )),
                PopButton(
                  text: 'Resubmit',
                  page: ForgetPasswordPage(),
                  fontcolor: const Color(0xff32B768),
                  fontSize: 16,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
