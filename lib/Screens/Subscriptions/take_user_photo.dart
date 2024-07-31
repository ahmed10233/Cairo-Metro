import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metro/Api/api.dart';
import 'package:metro/widgets/Constants.dart';
import 'package:metro/widgets/backIcon.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UserPhoto extends StatefulWidget {
  const UserPhoto({
    Key? key,
  }) : super(key: key);

  @override
  State<UserPhoto> createState() => UserPhotoState();
}

class UserPhotoState extends State<UserPhoto> {
  String? token = Constants.userToken;
  final imagePicker = ImagePicker();
  bool isLoading = false;
  XFile? userPhoto;
  late File userImage;

  Future<void> takeImage(ImageSource source) async {
    var pickedImage = await imagePicker.pickImage(
        source: source, maxHeight: 700, maxWidth: 900);
    if (pickedImage != null) {
      setState(() {
        userPhoto = pickedImage;
        userImage = File(pickedImage.path);
      });
    }
  }

  void showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image From'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                sourceButton('Camera', ImageSource.camera),
                const SizedBox(height: 20),
                sourceButton('Gallery', ImageSource.gallery),
              ],
            ),
          ),
        );
      },
    );
  }

  ElevatedButton sourceButton(String label, ImageSource source) {
    return ElevatedButton(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
        takeImage(source);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: ListView(
            children: [
              const backIcon(),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Upload your photo please",
                  style: TextStyle(
                      color: Color(0xffC01414),
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 150,
                backgroundColor: const Color.fromARGB(255, 195, 192, 192),
                child: ClipOval(
                  child: userPhoto == null
                      ? Image.network(
                          width: 300,
                          height: 300,
                          fit: BoxFit.cover,
                          'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Photo.png')
                      : Image.file(
                          userImage,
                          fit: BoxFit.cover,
                          width: 300,
                          height: 300,
                        ),
                ),
              ),
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  'Make sure your face is clear',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: kButtonColor),
                ),
              ),
              const SizedBox(height: 150),
              ElevatedButton(
                onPressed: showImageSourceDialog,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  fixedSize: const Size(342, 48),
                  backgroundColor: const Color(0xff4280EF),
                ),
                child: Text(
                  userPhoto != null ? 'Take a new photo' : 'Take a photo',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: userPhoto != null
                    ? () async {
                        try {
                          setState(() {
                            isLoading = true;
                          });

                          await checkPhoto();

                          setState(() {
                            isLoading = false;
                          });
                        } catch (e) {
                          setState(() {
                            isLoading = false;
                          });
                          Fluttertoast.showToast(
                            msg: ("there is an error tray again"),
                           toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 255, 0, 0),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
                          );
                        }
                      }
                    :null,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  fixedSize: const Size(342, 48),
                  backgroundColor: const Color(0xffC01414),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  checkPhoto() async {
    try {
      await Api().photoCheck(context: context, profileImage: userPhoto,);
      
    } on Exception catch (e) {
      Fluttertoast.showToast(
        msg: ('$e'),
        toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:const Color.fromARGB(255, 255, 0, 0),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
      );
    }
  }
}


// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:metro/Api/api.dart';
// import 'package:metro/main.dart';
// import 'package:metro/widgets/Constants.dart';
// import 'package:metro/widgets/backIcon.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// class UploadProfilePhoto extends StatefulWidget {
//   const UploadProfilePhoto({Key? key, this.frontSubImage, this.backSubImage})
//       : super(key: key);

//   final XFile? frontSubImage;
//   final XFile? backSubImage;

//   @override
//   State<UploadProfilePhoto> createState() => UploadProfilePhotoState();
// }

// class UploadProfilePhotoState extends State<UploadProfilePhoto> {
//   String? token = Constants.userToken;
//   final imagePicker = ImagePicker();
//   bool isLoading = false;
//   XFile? userPhoto;
//   late File userImage;

//   Future<void> takeImage(ImageSource source) async {
//     var pickedImage = await imagePicker.pickImage(
//         source: source, maxHeight: 700, maxWidth: 900);
//     if (pickedImage != null) {
//       setState(() {
//         userPhoto = pickedImage;

//         userImage = File(pickedImage.path);
//       });
//     }
//   }

//   void showImageSourceDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Select Image From'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 sourceButton('Camera', ImageSource.camera),
//                 const SizedBox(height: 20),
//                 sourceButton('Gallery', ImageSource.gallery),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   ElevatedButton sourceButton(String label, ImageSource source) {
//     return ElevatedButton(
//       child: Container(
//         alignment: Alignment.center,
//         child: Text(
//           label,
//           style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//       ),
//       onPressed: () {
//         Navigator.of(context).pop();
//         takeImage(source);
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ModalProgressHUD(
//       inAsyncCall: isLoading,
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 14),
//           child: ListView(
//             children: [
//               const backIcon(),
//               const SizedBox(height: 10),
//               const Center(
//                 child: Text(
//                   "Upload your photo please",
//                   style: TextStyle(
//                       color: Color(0xffC01414),
//                       fontWeight: FontWeight.bold,
//                       fontSize: 30),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               CircleAvatar(
//                 radius: 150,
//                 backgroundColor: const Color.fromARGB(255, 195, 192, 192),
//                 child: ClipOval(
//                         child: userPhoto == null
//                     ?  Image.network(
//                       width: 300,
//                       height: 300,
//                       fit:BoxFit.cover,
//                       'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Photo.png')
//                     : Image.file(
//                           userImage,
//                           fit: BoxFit.cover,
//                           width: 300,
//                           height: 300,
//                         ),
//                       ),
//               ),
//               const SizedBox(height: 40),
//               const Center(
//                 child: Text(
//                   'Make sure your face is clear',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                       color: kButtonColor),
//                 ),
//               ),
//               const SizedBox(height: 150),
//               ElevatedButton(
//                 onPressed: showImageSourceDialog,
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8)),
//                   fixedSize: const Size(342, 48),
//                   backgroundColor: const Color(0xff4280EF),
//                 ),
//                 child: Text(
//                   userPhoto != null ? 'Take a new photo' : 'Take a photo',
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ),
//               const SizedBox(height: 18),
//               ElevatedButton(
//                 onPressed: userPhoto != null
//                     ? () async {
//                         try {
//                           setState(() {
//                             isLoading = true;
//                           });

//                           await sendMethod();

//                           setState(() {
//                             isLoading = false;
//                           });
//                         } catch (e) {
//                           setState(() {
//                             isLoading = false;
//                           });
//                           Fluttertoast.showToast(
//                             msg: ("there is an error tray again"),
//                             toastLength: Toast.LENGTH_LONG,
//                             gravity: ToastGravity.CENTER,
//                             backgroundColor: const Color.fromARGB(255, 0, 0, 0),
//                             textColor: const Color.fromARGB(255, 255, 255, 255),
//                             fontSize: 16.0,
//                           );
//                         }
//                       }
//                     : null,
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8)),
//                   fixedSize: const Size(342, 48),
//                   backgroundColor: const Color(0xffC01414),
//                 ),
//                 child: const Text(
//                   'Continue',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   sendMethod() async {
//     try {
//       await Api().sendSubscriptionRequest(
//         fullName: sharedPref.getString("fullName")!,
//         nationalId: sharedPref.getString("nationalID")!,
//         birthDate: sharedPref.getString("birthDate")!,
//         address: sharedPref.getString("adderss")!,
//         email: sharedPref.getString("email")!,
//         studentId: sharedPref.getString("studentID")!,
//         universityName: sharedPref.getString("uniName")!,
//         universityLevel: sharedPref.getString("uniLevel")!,
//         startStation: sharedPref.getString("start")!,
//         endStation: sharedPref.getString("end")!,
//         nationalIdBackImage: widget.frontSubImage!,
//         nationalIdFrontImage: widget.backSubImage!,
//         profileImage: userPhoto!,context: context
//       );
//     } catch (e) {
//       Fluttertoast.showToast(
//         msg: ('$e'),
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.CENTER,
//         backgroundColor: const Color.fromARGB(255, 0, 0, 0),
//         textColor: const Color.fromARGB(255, 255, 255, 255),
//         fontSize: 16.0,
//       );
//     }
//   }
// }