import 'package:flutter/material.dart';
import 'package:metro/widgets/Constants.dart';
import 'package:metro/widgets/backIcon.dart';

class WaitingSubPage extends StatelessWidget {
  const WaitingSubPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const backIcon(),
            const SizedBox(
              height: 200,
            ),
           const Text('Your request is under reviewed',
             style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
             ),),
            const SizedBox(
              height: 30,
            ),
            Image.asset(
            'assets/images/Home/Sand Watch.png',
              height: 150,
            ),
             const SizedBox(
              height: 30,
            ),
             const Text('Your academic institution is ', style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
             ),),
              const Center(
                child: Text('currently reviewing all your data',style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
                             ),),
              ),


            
          ],
        ),
      ),
    );
  }

  
}
  

