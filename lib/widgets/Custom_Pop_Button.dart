import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PopButton extends StatelessWidget {
  PopButton(
      {super.key,
      required this.text,
      required this.page,
      required this.fontcolor,
      required this.fontSize});
  String text;
  Widget page;
  double fontSize;
  Color fontcolor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: ((context) => page),
              ),
            );
          },
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
              color: fontcolor,
            ),
          ),
        ),
      ],
    );
  }
}
