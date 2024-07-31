import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metro/Screens/Subscriptions/back_ID_Sub.dart';

import 'package:metro/widgets/Constants.dart';
import 'package:metro/widgets/backIcon.dart';

class FrontIdSubPage extends StatefulWidget {
  const FrontIdSubPage({super.key, this.userPhoto});
  final XFile? userPhoto;
  @override
  State<FrontIdSubPage> createState() => FrontIdSubPageState();
}

class FrontIdSubPageState extends State<FrontIdSubPage> {
  XFile? frontID;
  late File frontSubImage;
  final imagePicker = ImagePicker();

  Future <void>takeImage(ImageSource source) async {
    var pickedImage = await imagePicker.pickImage(
     source: source,
     maxHeight: 700,
     maxWidth: 900,
    );
    if (pickedImage != null) {
      setState(() {
        frontID = pickedImage;
        frontSubImage = File(pickedImage.path);
      });
    } else {}
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
                const SizedBox(height: 18),
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: ListView(
          children: [
            const backIcon(),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'Confirm the front side of the card',
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
    child: frontID == null
        ? SizedBox(
            width: 300,
            height: 220,
            child: Container(
              child: Image.asset('assets/images/Registration/verifave-egyptian-national-id-verification-oxz9bo7wfu9ylcbcybp23eyihq9s4z57dsb9ks9gncgggggggggggggg.png'),
              color: Colors.grey[300],
              
            ),
          )
        : Image.file(
            frontSubImage,
          ),
  ),
),

            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Text(
                'Make sure there is good lighting and data is clear',
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  fixedSize: const Size(342, 48),
                  backgroundColor: const Color(0xff4280EF)),
              child: frontID  != null
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
              onPressed: frontID != null
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  BackIdSubPage(frontSubImage: frontID,userPhoto: widget.userPhoto,),
                        ),
                      );
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
           const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
