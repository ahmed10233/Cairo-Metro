
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metro/Api/api.dart';
import 'package:metro/main.dart';

import 'package:metro/widgets/Constants.dart';
import 'package:metro/widgets/backIcon.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class BackIdSubPage extends StatefulWidget {
  const BackIdSubPage({super.key, this.frontSubImage, this.userPhoto});
  final XFile? frontSubImage;
  final XFile? userPhoto;

  @override
  State<BackIdSubPage> createState() => BackIdSubPageState();
}




class BackIdSubPageState extends State<BackIdSubPage> {
  XFile? backID;
  late File backSubImage;
  final imagePicker = ImagePicker();
  bool isLoading=false;


 Future takeImage(ImageSource source)async{
    var pickedImage = await imagePicker.pickImage( 
       source: source,
      maxHeight: 700,
      maxWidth: 900,);
    if(pickedImage != null ){
      setState(() {
        backID = pickedImage;
        backSubImage = File(pickedImage.path);

      });
    }else{}
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
                ElevatedButton(
                  child: Container(

                  alignment: Alignment.center,
                  
                    child: const Text('Camera',
                    style: TextStyle(
                      
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),)),
                  onPressed: () {
                    Navigator.of(context).pop();
                    takeImage(ImageSource.camera);
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text('Gallery',
                     style: TextStyle(
                     
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),)),
                  onPressed: () {
                    Navigator.of(context).pop();
                    takeImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
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
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text('Confirm the back side of the card',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: kButtonColor,
                ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
      
                           SizedBox(
        child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: backID == null
          ? SizedBox(
              width: 290,
              height: 225,
              child: Container(
                child: Image.asset('assets/images/Registration/Egyption_ID.png'),
                
                color: Colors.grey[300],
               
              ),
            )
           : Image.file(backSubImage,
                fit: BoxFit.fitWidth,
                ),
              ),),
              const SizedBox(
                height: 40,
              ),
              const Center(
                child: Text('Make sure there is good lighting and data is clear',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: kButtonColor,
                ),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              ElevatedButton(
          onPressed: () {
         showImageSourceDialog();
          
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              fixedSize: const Size(342, 48),
              backgroundColor:const Color(0xff4280EF)),
          child: backID  != null
                        ?  const Text(
              'Take a new photo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ):const Text(
              'Take a photo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            )
              ),
      
              const SizedBox(
                height: 18,
              ),
      
      
              ElevatedButton(
                  onPressed: 
      
                          backID != null
                      ? () async {
                        try {
                          setState(() {
                            isLoading = true;
                          });

                          await sendMethod();

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
                    : null,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fixedSize: const Size(342, 48),
                    backgroundColor: const Color(0xffC01414),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 40,)
          
            ],
          ),
        ),
      
      ),
    );
  }
   sendMethod() async {
    try {
      await Api().sendSubscriptionRequest(
        fullName: sharedPref.getString("fullName")!,
        nationalId: sharedPref.getString("nationalID")!,
        birthDate: sharedPref.getString("birthDate")!,
        address: sharedPref.getString("adderss")!,
        email: sharedPref.getString("email")!,
        studentId: sharedPref.getString("studentID")!,
        universityName: sharedPref.getString("uniName")!,
        universitySpecialization: sharedPref.getString('universitySpecialization')!,
        universityLevel: sharedPref.getString("uniLevel")!,
        startStation: sharedPref.getString("start")!,
        endStation: sharedPref.getString("end")!,
        nationalIdBackImage: backID,
        nationalIdFrontImage: widget.frontSubImage,
        profileImage: widget.userPhoto,
        context: context,
         
      );
    } catch (e) {
      print (e);
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