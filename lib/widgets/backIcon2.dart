import 'package:flutter/material.dart';

class backIcon2 extends StatelessWidget {
  const backIcon2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 17,
          ),
        ),
        const Text(
          "Back",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w600, //semibold=w600
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
