
import 'dart:convert';

import 'package:metro/Api/api.dart';
import 'package:metro/Screens/AppHome/appHome_page.dart';
import 'package:metro/models/login_model.dart';



class LogInService {
var context ;
LogInService({required this.context});
Future<LogInModel> logIn(
  {
     required LogInModel logInModel
  }
)async{
 // debugPrint('Service: email ${logInModel} , pass $password');
  Map<String, dynamic> data =
  await Api().post(url: 'https://metro-app-shun.onrender.com/api/v1/user/signIn',
   body:
    jsonEncode (logInModel.toJson()),
     context: context, 
     nextScreen: const AppHome()
   );
   return LogInModel.fromJson(data);
}


}