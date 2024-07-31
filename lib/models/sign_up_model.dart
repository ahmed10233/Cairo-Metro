class SignUpModel {
  String? firstName;
  String? lastName;
  String? email;
  String? ssn;
  String? password;
 //   String? confirmPassword;

  SignUpModel(
      {required this.firstName,
       required this.lastName,
       required this.email,
       required this.ssn, 
       required this.password,
      //  this.confirmPassword,
        }
        );

  SignUpModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    ssn = json['ssn'];
    password = json['password'];
   // confirmPassword = json['confirmPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['ssn'] = ssn;
    data['password'] = password;
    //data['confirmPassword'] = confirmPassword;
    return data;
  }
}