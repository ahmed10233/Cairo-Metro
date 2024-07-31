import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metro/Screens/AppHome/appHome_page.dart';
import 'package:metro/Screens/GetStartedAndSplash/Ui/GetStarted&Splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPref;
void main() async{
  
    WidgetsFlutterBinding.ensureInitialized();
    sharedPref = await SharedPreferences.getInstance();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const CairoMetro());
}

class CairoMetro extends StatelessWidget {
  const CairoMetro({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      
  routes: {
    AppHome.id: (context) => const AppHome(),
    GetStarted.id: (context) => const GetStarted(), // Add your SplashScreen here
    // other routes
  },
      home: sharedPref.getString("token")== null ? const GetStarted() :const AppHome(),
    );
  }
}
