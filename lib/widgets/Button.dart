import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.buttonColor,
    required this.page,
  });

  final String text;

  final Color buttonColor;

  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          fixedSize: const Size(350, 50),
          backgroundColor: buttonColor),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
