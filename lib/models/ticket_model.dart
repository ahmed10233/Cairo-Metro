class TicketModel {
  bool? status;
  String? message;
  String? qrcode;

  TicketModel({this.status, this.message, this.qrcode});

  TicketModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    qrcode = json['Qrcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['Qrcode'] = qrcode;
    return data;
  }
}