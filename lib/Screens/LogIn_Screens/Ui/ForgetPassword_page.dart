import 'package:flutter/material.dart';
import 'package:metro/Screens/LogIn_Screens/Ui/Login_page.dart';
import 'package:metro/Screens/Email_Screens/Ui/MailChecker_Page.dart';
import 'package:metro/widgets/Constants.dart';
import 'package:metro/widgets/Custom_Pop_Button.dart';
import 'package:metro/widgets/backIcon.dart';

class ForgetPasswordPage extends StatefulWidget {
  ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController emailController = TextEditingController();
  bool showEmailError = false;

  bool isEmailValid(String email) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
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
              height: 60,
            ),
            Image.asset(
              'assets/images/Registration/forget pass.jpg',
              height: 180,
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              '   Forgot Password',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const Text(
              '     Enter your registered email ',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 65, 65, 65),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: emailController,
              onChanged: (emailController) {
                setState(() {
                  showEmailError = !isEmailValid(emailController);
                });
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 12,
                ),
                hintText: "Email",
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff2C2C2C),
                ),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          showEmailError ? Colors.red : const Color(0xffE1E1E1),
                      width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color:
                        showEmailError ? Colors.red : const Color(0xffE1E1E1),
                    width: 1.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 55,
              child: Visibility(
                visible: showEmailError,
                child: const Text(
                  'please enter a valid Email',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFF0914),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'Remember the password? ',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 65, 65, 65),
                    ),
                  ),
                ),
                PopButton(
                    text: 'Login',
                    page: const LoginPage(),
                    fontcolor: Colors.red,
                    fontSize: 15),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            ElevatedButton(
              onPressed: isEmailValid(emailController.text)
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MailCheckPage(),
                        ),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  fixedSize: const Size(342, 48),
                  backgroundColor: Colors.black,
              ),
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
