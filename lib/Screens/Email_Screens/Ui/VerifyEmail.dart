import 'package:flutter/material.dart';
import 'package:metro/Screens/Nathional_ID_Screens/Ui/Nathional_ID_card.dart';
import 'package:metro/Screens/SignUp_Screens/Ui/SignUp_Page.dart';
import 'package:metro/widgets/Button.dart';
import 'package:metro/widgets/CustomTextButton.dart';
import 'package:metro/widgets/backIcon.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  
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
      body:  Column(
        children: [
          const backIcon(),
          const SizedBox(height: 15),
          const Text(
            'Verify your email',
            style: TextStyle(
              color: Color(0xffC01414),
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 80),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Confirm your email address by',
                style: TextStyle(
                  color: Color(0xff2C2C2C),
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text(
                'clicking the link in the email we',
                style: TextStyle(
                  color: Color(0xff2C2C2C),
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 164),
                child: Text(
                  'sent to you:',
                  style: TextStyle(
                    color: Color(0xff2C2C2C),
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 340),
             child: CustomTextButton(fontSize:18 , text: 'Resubmit', page:const SignUpPage(), fontcolor: const Color.fromARGB(255, 12, 176, 48),)
            // Text(
            //   'Resubmit',
            //   style: TextStyle(
            //     color: Color(0xff32B768),
            //     fontWeight: FontWeight.bold,
            //     fontSize: 19,
            //   ),
            // ),
          ),
          const SizedBox(height: 25),
          const Button(
            text: 'Continue',
            buttonColor: Color(0xff32B768),
            page: NathionalIDCard(),
          ),
        ],
      ),
    );
  }
}
