class UserModel {

  int? accountBalance;

  UserModel({ this.accountBalance});

  UserModel.fromJson(Map<String, dynamic> json) {

    accountBalance = json['accountBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['accountBalance'] = accountBalance;
    return data;
  }
}