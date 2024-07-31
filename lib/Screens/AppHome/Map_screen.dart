import 'package:flutter/material.dart';
import 'package:metro/widgets/backIcon.dart';

class Mapp extends StatelessWidget {
  const Mapp({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40,),
            const backIcon(),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8, // Adjust the percentage as needed
                child: InteractiveViewer(
                  boundaryMargin: const EdgeInsets.all(20.0), // Adjust margin as needed
                  minScale: 0.1,
                  maxScale: 4.0,
                  child: Image.asset('assets/images/Home/CairoMetroMap-1.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
