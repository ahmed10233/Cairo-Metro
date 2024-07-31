import 'package:flutter/material.dart';
import 'package:metro/widgets/backIcon.dart';

class SignUpLabel extends StatelessWidget {
  const SignUpLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        backIcon(),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Center(
            child: Text(
              "Sign"
              " up",
              style: TextStyle(
                color: Color(0xffC01414),
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 13),
          child: Text(
            " create a new account",
            style: TextStyle(
              color: Color(0xff2C2C2C),
              fontWeight: FontWeight.w600, //semibold=w600
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
