import 'package:flutter/material.dart';
import 'package:metro/screens/LogIn_Screens/Ui/Login_page.dart';
import 'package:metro/widgets/backIcon.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool obscureText = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController nameController2 = TextEditingController();
  bool showResetPasswordIdError = false;
  bool showReResetPasswordIdError = false;

  bool _isPasswordMismatchh() {
    return nameController.text != nameController2.text; // true
  }

  bool _isPasswordValid(String password) {
    return RegExp(r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])([a-zA-Z0-9]{8,})$')
        .hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.white,
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(1),
      //   child: AppBar(
      //     backgroundColor: Colors.white,
      //     elevation: 30000,
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const backIcon(),
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/images/Registration/reset password.jpg',
              height: 150,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Reset Password',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'Enter your new password twice below',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff9CA3AF),
                ),
              ),
            ),
            const Text(
              'to reset a new password',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff9CA3AF),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: nameController,
              onChanged: (nameController) {
                setState(() {
                  showResetPasswordIdError = !_isPasswordValid(nameController);
                });
              },
              obscureText: obscureText,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    color: Colors.grey,
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    }),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 12,
                ),
                hintText: "Enter new Password",
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff2C2C2C),
                ),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: showResetPasswordIdError
                          ? Colors.red
                          : const Color(0xffE1E1E1),
                      width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: showResetPasswordIdError
                        ? Colors.red
                        : const Color(0xffE1E1E1),
                    width: 1.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: Visibility(
                visible: showResetPasswordIdError,
                child: const Text(
                  'please enter a valid password. Must be a minimum of 8 characters',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFF0914),
                  ),
                ),
              ),
            ),
            TextField(
              controller: nameController2,
              onChanged: (nameController2) {
                setState(() {
                  showReResetPasswordIdError = _isPasswordMismatchh();
                });
              },
              obscureText: obscureText,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    color: Colors.grey,
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    }),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 12,
                ),
                hintText: "Re-enter the new Password",
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff2C2C2C),
                ),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: showReResetPasswordIdError
                          ? Colors.red
                          : const Color(0xffE1E1E1),
                      width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: showReResetPasswordIdError
                        ? Colors.red
                        : const Color(0xffE1E1E1),
                    width: 1.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: Visibility(
                visible: showReResetPasswordIdError,
                child: const Text(
                  'Password do not match !',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFF0914),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: ElevatedButton(
                onPressed: !_isPasswordMismatchh() &&
                    _isPasswordValid(nameController.text)
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginPage()),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    fixedSize: const Size(342, 48),
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
                child: const Text(
                  'Reset password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
