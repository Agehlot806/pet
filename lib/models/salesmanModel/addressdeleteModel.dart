class SalesAddressDeleteModel {
  String? status;
  int? data;
  String? message;

  SalesAddressDeleteModel({this.status, this.data, this.message});

  SalesAddressDeleteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.data;
    data['message'] = this.message;
    return data;
  }
}