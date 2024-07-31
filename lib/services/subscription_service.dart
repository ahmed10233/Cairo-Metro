// import 'dart:io';

// import 'package:metro/Api/api_multi.dart';
// import 'package:metro/models/subscription_model.dart';

// class SubscriptionService {
//   var context;
//   SubscriptionService({required this.context});

//   Future<SubscriptionModel> subscription({
//     required SubscriptionModel subscriptionModel,
//   }) async {
//     Map<String, String> fields = {
//       'fullName': subscriptionModel.fullName ?? '',
//       'nationalId': subscriptionModel.nationalID ?? '',
//       'email': subscriptionModel.email ?? '',
//       'studentId': subscriptionModel.studentID ?? '',
//       'address': subscriptionModel.adderss ?? '',
//       'birthDate': subscriptionModel.birthDate ?? '',
//       'universityLevel': subscriptionModel.universityLevel ?? '',
//       'universityName': subscriptionModel.universityName ?? '',
//       'startStation': subscriptionModel.start ?? '',
//       'endStation': subscriptionModel.end ?? '',
//     };


//     Map<String, dynamic> data = await ApiMulti().postMultipart(

//     );

//     return SubscriptionModel.fromJson(data);
//   }
// }
