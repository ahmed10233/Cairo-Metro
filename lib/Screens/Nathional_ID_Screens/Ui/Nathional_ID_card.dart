import 'package:flutter/material.dart';
import 'package:metro/Screens/Nathional_ID_Screens/Ui/Front_ID_Page.dart';
import 'package:metro/widgets/Button.dart';
import 'package:metro/widgets/backIcon.dart';


class NathionalIDCard extends StatelessWidget {
  const NathionalIDCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            const backIcon(),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  "Nathional ID card",
                  style: TextStyle(
                    color: Color(0xffC01414),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                "Take a photo of the front and back",
                style: TextStyle(
                  color: Color(0xff2C2C2C),
                  fontWeight: FontWeight.w600, //semibold=w600
                  fontSize: 20,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "of your ID card",
                style: TextStyle(
                  color: Color(0xff2C2C2C),
                  fontWeight: FontWeight.w600, //semibold=w600
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
                height: 180,
                child: Image.asset('assets/images/Registration/frontAndBackID.jpg')),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/images/Registration/full size.jpg',height: 100),
                Image.asset('assets/images/Registration/clear.jpg',height: 100 ),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
                height: 100,
                child: Image.asset('assets/images/Registration/No reflections.jpg')),
            const SizedBox(height: 100),
            const Button(
                text: 'Continue',
                buttonColor: Color(0xffC01414),
                page: FrontIdPage()),
          ],
        ),
      ),
    );
  }
}
