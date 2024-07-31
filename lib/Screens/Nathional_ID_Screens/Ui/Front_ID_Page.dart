import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metro/Screens/Nathional_ID_Screens/Ui/Back_ID_page.dart';

import 'package:metro/widgets/Constants.dart';
import 'package:metro/widgets/backIcon.dart';

class FrontIdPage extends StatefulWidget {
  const FrontIdPage({super.key});

  @override
  State<FrontIdPage> createState() => _FrontIdPageState();
}

class _FrontIdPageState extends State<FrontIdPage> {
  XFile? image;
  late File frontImage;
  final imagePicker = ImagePicker();

  Future<void> takeImage(ImageSource source) async {
    var pickedImage = await imagePicker.pickImage(
      source: source,
      maxHeight: 700,
      maxWidth: 900,
    );
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
        frontImage = File(pickedImage.path);
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
    child: image == null
        ? SizedBox(
            width: 200,
            height: 220,
            child: Container(
              child: Image.asset(
                'assets/images/Registration/verifave-egyptian-national-id-verification-oxz9bo7wfu9ylcbcybp23eyihq9s4z57dsb9ks9gncgggggggggggggg.png'),
              //color: Colors.grey[300],
              
            ),
          )
        : Image.file(
            frontImage,
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
              child: image != null
                  ? const Text(
                      'Take a new photo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : const Text(
                      'Take photo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
            const SizedBox(
              height: 18,
            ),
            ElevatedButton(
              onPressed: image != null
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BackIdPage(frontImage: image),
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
