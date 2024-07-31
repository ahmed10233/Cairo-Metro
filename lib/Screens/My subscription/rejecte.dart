import 'package:flutter/material.dart';
import 'package:metro/widgets/Constants.dart';
import 'package:metro/widgets/backIcon.dart';

class RejectedSubPage extends StatelessWidget {
  const RejectedSubPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const backIcon(),
            const SizedBox(
              height: 200,
            ),
             const Text('Your request has been',
             style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
             ),),
             const Text(' rejected',
             style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
             ),),
            const SizedBox(
              height: 30,
            ),
            Image.asset(
            'assets/images/Home/X.png',
              height: 150,
            ),
             const SizedBox(
              height: 30,
            ),
const Text('Your request was rejected because you ',
             style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
             ),),
             const Text('are not enrolled in the educational ',
             style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
             ),),
             const Text('institution mentioned',
             style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
             ),),    
          ],
        ),
      ),
    );
  }

  
}
  

