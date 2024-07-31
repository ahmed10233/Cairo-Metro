import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
 CustomTextField({Key? key, required this.contloller, required this.hintText}) : super(key: key);
  final String hintText;
  TextEditingController  contloller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: contloller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 12,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
         
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Color(0xff2C2C2C),
        ),
        fillColor:  Colors.white,
        filled: true,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color:Color(0xffE1E1E1), width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xffE1E1E1),
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
