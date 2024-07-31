class GetMySubModel {
  bool? status;
  MySubscription? mySubscription;

  GetMySubModel({this.status, this.mySubscription});

  GetMySubModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mySubscription = json['MySubscription'] != null
        ? MySubscription.fromJson(json['MySubscription'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (mySubscription != null) {
      data['MySubscription'] = mySubscription!.toJson();
    }
    return data;
  }
}

class MySubscription {
  String? sId;
  String? userId;
  String? profileImage;
  String? qrString;
  int? numOfTrips;
  String? endDate;
  bool? active;
  String? createdAt;
  String? updatedAt;
  int? iV;

  MySubscription(
      {this.sId,
      this.userId,
      this.profileImage,
      this.qrString,
      this.numOfTrips,
      this.endDate,
      this.active,
      this.createdAt,
      this.updatedAt,
      this.iV});

  MySubscription.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    profileImage = json['profileImage'];
    qrString = json['qrString'];
    numOfTrips = json['numOfTrips'];
    endDate = json['endDate'];
    active = json['active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['userId'] = userId;
    data['profileImage'] = profileImage;
    data['qrString'] = qrString;
    data['numOfTrips'] = numOfTrips;
    data['endDate'] = endDate;
    data['active'] = active;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}