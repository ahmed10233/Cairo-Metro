

class ShowNumTicketModel {
  int? countPrice6;
  int? countPrice8;
  int? countPrice12;

  ShowNumTicketModel({this.countPrice6, this.countPrice8, this.countPrice12});

  ShowNumTicketModel.fromJson(Map<String, dynamic> json) {
    countPrice6 = json['countPrice6'];
    countPrice8 = json['countPrice8'];
    countPrice12 = json['countPrice12'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['countPrice6'] = countPrice6;
    data['countPrice8'] = countPrice8;
    data['countPrice12'] = countPrice12;
    return data;
  }
}