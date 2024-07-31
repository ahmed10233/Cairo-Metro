import 'package:flutter/material.dart';
import 'package:metro/main.dart';
import 'package:metro/widgets/buttomBar.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  TextEditingController amount = TextEditingController();
  int? userBalance;
  bool isCheck = false;
  bool isChecks = false;
  bool showWalletNumber = false;

  @override
  void initState() {
    super.initState();
    getBalace();
  }

  void getBalace() {
    setState(() {
      userBalance = sharedPref.getInt("accountBalance");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           const ButtomBar(),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Home/Wallet.jpg',
                  height: 50,
                  width: 65,
                ),
                const SizedBox(width: 10), // Added SizedBox for spacing
                const Text(
                  'Your balance: ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '$userBalance',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            const Text(
              'Deposit money in your wallet',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black, width: 1),
              ),
              height: 240,
              width: 330,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // Centering the Column
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        activeColor: const Color(0xffC01414),
                        value: isCheck,
                        onChanged: (newBool) {
                          setState(() {
                            isCheck = newBool!;
                            isChecks = false;
                            showWalletNumber = false;
                          });
                        },
                      ),
                      Image.asset(
                        'assets/images/Home/payment1.jpg',
                        height: 80,
                        width: 220,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        activeColor: const Color(0xffC01414),
                        value: isChecks,
                        onChanged: (newBool) {
                          setState(() {
                            isChecks = newBool!;
                            isCheck = false;
                            showWalletNumber = true;
                          });
                        },
                      ),
                      Image.asset(
                        'assets/images/Home/payment2.jpg',
                        height: 80,
                        width: 220,
                      ),
                    ],
                  ),
                  Visibility(
                    visible: showWalletNumber,
                    child: SizedBox(
                      height: 35,
                      width: 190,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          hintText: "wallet number",
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              color: Colors.blueAccent,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 35,
              width: 180,
              child: TextField(
                controller: amount,
                onChanged: (value) {},
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 45,
                  ),
                  hintText: 'Amount',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      color: Colors.blueAccent,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Type the amount of money you want to deposit',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fixedSize: const Size(125, 35),
                backgroundColor: const Color(0xffC01414),
              ),
              child: const Text(
                'Deposit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
