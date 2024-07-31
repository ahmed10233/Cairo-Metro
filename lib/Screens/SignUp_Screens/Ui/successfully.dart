import 'package:flutter/material.dart';
import 'package:metro/Screens/LogIn_Screens/Ui/Login_page.dart';
import 'package:metro/widgets/Button.dart';


class SuccessfullRegistrationPage extends StatelessWidget {
  const SuccessfullRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 30000,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            const SizedBox(
              height: 120,
            ),
            Center(child: Image.asset('assets/images/Registration/succese.jpg')),
           const SizedBox(height: 50,),
            const Text(
              'Your account has been created successfully',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xff32B768)),
            ),
            const SizedBox(
              height: 200,
            ),
            const Button(
              page: LoginPage(),
                text: 'Go to Login page',
                buttonColor: Color(0xff32B768),
                ),
                const SizedBox(
                  height: 50,
                )
          ],
        ),
      ),
    );
  }
}
