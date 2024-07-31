class GetTicketModel {
  Data? data;

  GetTicketModel({this.data});

  GetTicketModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? qrcode;
  int? price;

  Data({
    this.qrcode,
    this.price,
  });

  Data.fromJson(Map<String, dynamic> json) {
    qrcode = json['Qrcode'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['Qrcode'] = qrcode;
    data['price'] = price;

    return data;
  }
}
