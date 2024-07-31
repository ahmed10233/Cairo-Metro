import 'package:flutter/material.dart';

class backIcon extends StatelessWidget {
  const backIcon({
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
            color: Color(0xff222222),
            size: 17,
          ),
        ),
        const Text(
          "Back",
          style: TextStyle(
            color: Color(0xff222222),
            fontWeight: FontWeight.w600, //semibold=w600
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
