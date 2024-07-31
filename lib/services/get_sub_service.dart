
import 'package:flutter/material.dart';
import 'package:metro/Api/api.dart';
import 'package:metro/models/get_sub_model.dart';

class GetMySubService{
final BuildContext context;
GetMySubService(this.context);
Future<GetMySubModel> getMySub(
  {

  required GetMySubModel getMySubmodel
  }


)async{
    Map<String, dynamic> data =
  await Api().get4(url: 'https://metro-app-shun.onrender.com/api/v1/user/getMySubscription', context: context, 

   );
   return GetMySubModel.fromJson(data);
}


}