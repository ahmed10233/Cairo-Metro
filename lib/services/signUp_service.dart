import 'dart:convert';
import 'package:metro/Api/api.dart';
import 'package:metro/Screens/Email_Screens/Ui/VerifyEmail.dart';
import 'package:metro/models/sign_up_model.dart';

class SignUpService {
var context ;
SignUpService({required this.context});
Future<SignUpModel> signUp(
  {
     required SignUpModel signUpModel
  }
)async{
 // debugPrint('Service: email ${logInModel} , pass $password');
  Map<String, dynamic> data =
  await Api().post(url: 'https://metro-app-shun.onrender.com/api/v1/user/signUp',
   body:
    jsonEncode (signUpModel.toJson()),
     context: context,
    nextScreen: const VerifyEmail()
   );
   return SignUpModel.fromJson(data);
}


}