// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metro/Screens/My%20subscription/my_subscription.dart';
import 'package:metro/Screens/My%20subscription/rejecte.dart';
import 'package:metro/Screens/My%20subscription/waiting_status.dart';
import 'package:metro/Screens/SignUp_Screens/Ui/successfully.dart';
import 'package:metro/Screens/Subscriptions/front_ID_Sub.dart';
import 'package:metro/Screens/Subscriptions/successfull_Requst.dart';
import 'package:metro/main.dart';
import 'package:metro/widgets/Constants.dart';
import 'package:mime/mime.dart';

class Api {
  String? token = Constants.userToken;
  Future<dynamic> post({
    required context,
    required nextScreen,
    required String url,
    dynamic body,
  }) async {
    token = Constants.userToken;
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: body,
        headers: <String, String>{
          "Content-Type": "application/json",
          // Add token to headers if provided
          "Authorization": "$token",
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        sharedPref.setString("token", data["token"]);
        Constants.userToken = data["token"];
       
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => nextScreen),
          ),
        );

        Fluttertoast.showToast(
          msg: 'Success ✅',
           toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 1, 185, 38),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
        );
        return data;
      } else if(response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);

        Fluttertoast.showToast(
          msg: '${data['message']}',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 1, 185, 38),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
        );

        return data;
      }else {
        Map<String, dynamic> data = jsonDecode(response.body);

        Fluttertoast.showToast(
          msg: '${data['message']}',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 255, 0, 0),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
        );

        return data;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'There is an Error, Please try again!',
        toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 255, 0, 0),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
      );
    }
  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////

  Future<dynamic> post2(
      {required context,
      required nextScreen,
      required String url,
      dynamic body,
      String? token}) async {
    token = Constants.userToken;
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: body,
        headers: <String, String>{
          "Content-Type": "application/json",
          // Add token to headers if provided
          "Authorization": "$token",
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => nextScreen),
          ),
        );

        Fluttertoast.showToast(
          msg: '${data['results']}',
           toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 1, 185, 38),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
        );
        return data;
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);

        Fluttertoast.showToast(
          msg: '${data['message']}',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 255, 0, 0),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
        );

        return data;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'There is an Error, Please try again!',
        toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 255, 0, 0),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
      );
    }
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Future<dynamic> get({required String url, String? token}) async {
    token = Constants.userToken;
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          "Authorization": "$token",

          // "Content-Type": "application/json",
          // Add token to headers if provided
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        //Print(data);

        sharedPref.setInt("accountBalance", data["accountBalance"]);

        return data;
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);
        Fluttertoast.showToast(
          msg: '${data['message']}',
           toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 1, 185, 38),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
        );
        return data;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'There is an Error, Please try again!',
         toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 255, 0, 0),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
      );
    }
  }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Future<dynamic> get2({required String url, String? token}) async {
    token = Constants.userToken;
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          "Authorization": "$token",

          // "Content-Type": "application/json",
          // Add token to headers if provided
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        sharedPref.setInt("countPrice6", data["countPrice6"]);
        sharedPref.setInt("countPrice8", data["countPrice8"]);
        sharedPref.setInt("countPrice12", data["countPrice12"]);

        return data;
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);
        
        Fluttertoast.showToast(
          msg: '${data['message']}',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 1, 185, 38),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
        );
        return data;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'There is an Error, Please try again!',
        toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 255, 0, 0),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
      );
    }
  }

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Future<dynamic> get4({required String url, required BuildContext context, String? token}) async {
  token = Constants.userToken;
  try {
    http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        "Authorization": "$token",
        // "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data['status'] == true) {
       
        sharedPref.setString("QrStringSub", data["MySubscription"]["qrString"]);
        sharedPref.setString( "profileImage", data["MySubscription"]["profileImage"]);
        sharedPref.setInt("numOfTrips", data["MySubscription"]["numOfTrips"]);
        sharedPref.setString("userId", data["MySubscription"]["userId"]);
        sharedPref.setString("fullName", data["MySubscription"]["fullName"]);
        sharedPref.setString("endDate", data["MySubscription"]["endDate"]);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyProfileScreen()),
        );
      } else if (data['status'] == 'waiting') {
       

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WaitingSubPage()),
        );
      } else if (data['status'] == 'rejected') {
        
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const RejectedSubPage()),
        );
      }

      return data;
    } else {
      Map<String, dynamic> data = jsonDecode(response.body);
      
      Fluttertoast.showToast(
        msg: 'sorry you don\'t have any subscriptions',
         toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 255, 0, 0),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
      );
      return data;
    }
  } catch (e) {
   
    Fluttertoast.showToast(
      msg: 'There is an Error, Please try again!',
      toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 255, 0, 0),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Future<dynamic> get3({required String url, String? token}) async {
    token = Constants.userToken;
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          "Authorization": "$token",
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        sharedPref.setString("Qrcode", data["data"]["Qrcode"]);

        return data;
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);
       
        Fluttertoast.showToast(
          msg: '${data['message']}',
           toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 255, 0, 0),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
        );
        return data;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'There is an Error, Please try again!',
        toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 255, 0, 0),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
      );
    }
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  Future<dynamic> sendRegisterIdImage(
      {
      XFile? nationalIdFrontImage,
      XFile? nationalIdBackImage,
     
      context}) async {
    String url =
        'https://metro-app-shun.onrender.com/api/v1/user/';

    var headers = {'Authorization': "$token"};

    var request = http.MultipartRequest('PUT', Uri.parse(url));
   
    var mimeType = lookupMimeType(nationalIdFrontImage!.path) ??
        'application/octet-stream';
    var fileStream = http.ByteStream(nationalIdFrontImage.openRead());
    var fileLength = await nationalIdFrontImage.length();
    var multipartFile = http.MultipartFile(
      'nationalIdFrontImage',
      fileStream,
      fileLength,
      filename: nationalIdFrontImage.path.split('/').last,
      contentType: MediaType.parse(mimeType),
    );

    request.files.add(multipartFile);

    var mimeType2 =
        lookupMimeType(nationalIdBackImage!.path) ?? 'application/octet-stream';
    var fileStream2 = http.ByteStream(nationalIdBackImage.openRead());
    var fileLength2 = await nationalIdBackImage.length();
    var multipartFile2 = http.MultipartFile(
      'nationalIdBackImage',
      fileStream2,
      fileLength2,
      filename: nationalIdBackImage.path.split('/').last,
      contentType: MediaType.parse(mimeType2),
    );

    request.files.add(multipartFile2);

   
   

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const SuccessfullRegistrationPage()),
      );
      
      Fluttertoast.showToast(
        msg: 'Done',
         toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 1, 185, 38),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
      );

    
    } else {
      Fluttertoast.showToast(
        msg: 'try again',
       toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 255, 0, 0),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
      );

      
    }
  }



  Future<dynamic> sendSubscriptionRequest(
      {required String fullName,
      required String nationalId,
      required String birthDate,
      required String email,
      required String studentId,
      required String address,
      required String universityName,
      required String universityLevel,
      required String startStation,
      required String endStation,
       required String universitySpecialization,
      XFile? nationalIdFrontImage,
      XFile? nationalIdBackImage,
      XFile? profileImage,
      context}) async {
    String url =
        'https://metro-app-shun.onrender.com/api/v1/user/subscriptionReq';

    var headers = {'Authorization': "$token"};

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll({
      'fullName': fullName,
      'nationalId': nationalId,
      'birthDate': birthDate,
      'email': email,
      'studentId': studentId,
      'address': address,
      'universityName': universityName,
      'universityLevel': universityLevel,
      'startStation': startStation,
      'endStation': endStation,
      'universitySpecialization':universitySpecialization,
    });
    var mimeType = lookupMimeType(nationalIdFrontImage!.path) ??
        'application/octet-stream';
    var fileStream = http.ByteStream(nationalIdFrontImage.openRead());
    var fileLength = await nationalIdFrontImage.length();
    var multipartFile = http.MultipartFile(
      'nationalIdFrontImage',
      fileStream,
      fileLength,
      filename: nationalIdFrontImage.path.split('/').last,
      contentType: MediaType.parse(mimeType),
    );

    request.files.add(multipartFile);

    var mimeType2 =
        lookupMimeType(nationalIdBackImage!.path) ?? 'application/octet-stream';
    var fileStream2 = http.ByteStream(nationalIdBackImage.openRead());
    var fileLength2 = await nationalIdBackImage.length();
    var multipartFile2 = http.MultipartFile(
      'nationalIdBackImage',
      fileStream2,
      fileLength2,
      filename: nationalIdBackImage.path.split('/').last,
      contentType: MediaType.parse(mimeType2),
    );

    request.files.add(multipartFile2);

    var mimeType3 =
        lookupMimeType(profileImage!.path) ?? 'application/octet-stream';
    var fileStream3 = http.ByteStream(profileImage.openRead());
    var fileLength3 = await profileImage.length();
    var multipartFile3 = http.MultipartFile(
      'profileImage',
      fileStream3,
      fileLength3,
      filename: profileImage.path.split('/').last,
      contentType: MediaType.parse(mimeType3),
    );

    request.files.add(multipartFile3);

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const SuccessfullSubscriptionPage()),
      );
      final responseData = await http.Response.fromStream(response);
      final Map<String, dynamic> data = json.decode(responseData.body);
      Fluttertoast.showToast(
        msg: '${data['results']}',
         toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 1, 185, 38),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
      );

    
    } else {
      print(response.statusCode);
      final responseData = await http.Response.fromStream(response);
      final Map<String, dynamic> data = json.decode(responseData.body);
      print(data['message']);
      Fluttertoast.showToast(
        msg: '${data['message']}',
       toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 255, 0, 0),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
      );

      
    }
  }


Future<dynamic> photoCheck({XFile? profileImage, context}) async {
  if (profileImage == null) {
    Fluttertoast.showToast(
      msg: 'Profile image is required',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      textColor: const Color.fromARGB(255, 255, 255, 255),
      fontSize: 16.0,
    );
    return;
  }

  String url = 'https://ai-repo-icwv.onrender.com/detect_person';

  var headers = {'Authorization': "$token"};

  var request = http.MultipartRequest('POST', Uri.parse(url));

  var mimeType = lookupMimeType(profileImage.path) ?? 'application/octet-stream';
  var fileStream = http.ByteStream(profileImage.openRead());
  var fileLength = await profileImage.length();
  var multipartFile = http.MultipartFile(
    'image',
    fileStream,
    fileLength,
    filename: profileImage.path.split('/').last,
    contentType: MediaType.parse(mimeType),
  );

  request.files.add(multipartFile);

  request.headers.addAll(headers);

  try {
    var response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await http.Response.fromStream(response);
      final Map<String, dynamic> data = json.decode(responseData.body);

      if (data['message'] == "Human detected in the photo!") {
        Fluttertoast.showToast(
          msg: 'Valid Image',
           toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 1, 185, 38),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FrontIdSubPage(userPhoto: profileImage),
          ),
        );
      } else if (data['message'] == "No human detected in the photo.") {
        Fluttertoast.showToast(
          msg: 'No human detected in the photo. Please try again.',
         toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 255, 0, 0),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
        );
      }

      // debugPrint(await response.stream.bytesToString());
    } else {
      final responseData = await http.Response.fromStream(response);
      final Map<String, dynamic> data = json.decode(responseData.body);
      Fluttertoast.showToast(
        msg: '${data['message']} please try again',
        toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 255, 0, 0),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
      );
    }
  } catch (e) {
    Fluttertoast.showToast(
      msg: 'An error occurred: $e',
      toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 255, 0, 0),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
    );
  }
}




}