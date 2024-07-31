import 'package:flutter/material.dart';
import 'package:metro/Screens/AppHome/appHome_page.dart';

class ButtomBar extends StatelessWidget {
  const ButtomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const AppHome()),
                      ),
                    );
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