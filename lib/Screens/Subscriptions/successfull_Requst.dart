import 'package:flutter/material.dart';
import 'package:metro/Screens/AppHome/appHome_page.dart';
import 'package:metro/widgets/Button.dart';


class SuccessfullSubscriptionPage extends StatelessWidget {
  const SuccessfullSubscriptionPage({super.key});

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
              'Your request has been received successfully',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xff32B768)),
            ),
            const SizedBox(
              height: 200,
            ),
            const Button(
              page: AppHome(),
                text: 'Go to Home page',
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
