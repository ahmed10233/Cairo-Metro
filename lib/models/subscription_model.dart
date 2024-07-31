

import 'dart:io';

import 'package:image_picker/image_picker.dart';


class SubscriptionModel{
  String? fullName;
  String? nationalID;
  String? email;
  String? studentID;
  String? adderss;
  String? birthDate;
  String? universityName;
  String? universityLevel;
  String? start;
  String? end;
  String? universitySpecialization;
  XFile? nationalIdFrontImage;
  XFile? nationalIdBackImage;
  File? profileImage;
  

  SubscriptionModel({
    this.fullName,
    this.nationalID,
    this.email,
    this.studentID,
    this.adderss,
    this.birthDate,
    this.universityLevel,
    this.universityName,
    this.start,
    this.end,
    this.nationalIdBackImage,
    this.nationalIdFrontImage,
    this.profileImage, 
    this.universitySpecialization 
    });

 SubscriptionModel.fromJson(Map<String,dynamic>json){

  fullName = json['fullName'];
  nationalID = json['nationalId'];
  email  = json['email'];
  studentID = json['studentId'];
  adderss = json['address'];
  birthDate = json['birthDate'];
  universityLevel = json['universityLevel'];
  universityName = json['universityName'];
  start = json['startStation'];
  end = json['endStation'];
  nationalIdBackImage = json['nationalIdBackImage'];
  nationalIdFrontImage = json['nationalIdFrontImage'];
  profileImage = json['profileImage'];
    universitySpecialization = json['universitySpecialization'];
 } 
 Map<String,dynamic>toJson(){

  final Map<String,dynamic>data=<String,dynamic>{};
  data['fullName']=fullName;
  data['nationalId']=nationalID;
  data['email']=email;
  data['studentId']=studentID;
  data['address']= adderss;
  data['birthDate']=  birthDate;
  data['universityLevel']= universityLevel ;
  data['universityName']=  universityName;
  data['startStation']= start ;
  data['endStation']= end ;
  data['nationalIdBackImage']=nationalIdBackImage ;
  data['nationalIdFrontImage']=nationalIdFrontImage;
  data['profileImage']=profileImage;
  data['universitySpecialization']=universitySpecialization;
  return data;
 }


}