import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:metro/Api/api.dart';
import 'package:metro/Screens/Subscriptions/subscription%20form.dart';
import 'package:metro/widgets/Button.dart';
import 'package:metro/widgets/Constants.dart';
import 'package:metro/widgets/backIcon.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SubscriptioPage extends StatefulWidget {
  const SubscriptioPage({super.key});

  @override
  State<SubscriptioPage> createState() => _SubscriptioPageState();
}

class _SubscriptioPageState extends State<SubscriptioPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const backIcon(),
              const SizedBox(
                height: 200,
              ),
              const Button(
                text: 'Make subscription',
                page: SubscriptionForm(),
                buttonColor: Color(0xffC01414),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/Home/card.png',
                height: 150,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    setState(() {
                      isLoading = true;
                    });

                    await getMySubMethod();
                    setState(() {
                      isLoading = false;
                    });
                  } on Exception {
                    setState(() {
                            isLoading = false;
                    });
                }},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    fixedSize: const Size(350, 50),
                    backgroundColor: const Color(0xff4280EF)),
                child: const Text(
                  "My Subscription",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getMySubMethod() async {
    try {
      
      await Api().get4(
        url:
            "https://metro-app-shun.onrender.com/api/v1/user/getMySubscription", context: context,
      );
    } on Exception {
      Fluttertoast.showToast(
        msg: ("there is an error"),
        toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 255, 0, 0),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
      );
    }
  }
}
