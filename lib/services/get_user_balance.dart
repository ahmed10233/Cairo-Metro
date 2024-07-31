

import 'package:metro/Api/api.dart';
import 'package:metro/models/user_model.dart';

class GetUserBalanceService {

GetUserBalanceService();
Future<UserModel> user(
  {
     required UserModel userModel
  }
)async{
 
  Map<String, dynamic> data =
  await Api().get(url: 'https://metro-app-shun.onrender.com/api/v1/user/getMyAccountBalance',

   );
   return UserModel.fromJson(data);
}


}