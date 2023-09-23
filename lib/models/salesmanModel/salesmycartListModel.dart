// class SalesMyCartListModel {
//   String? status;
//   List<Data>? data;
//   String? message;

//   SalesMyCartListModel({this.status, this.data, this.message});

//   SalesMyCartListModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//     message = json['message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['message'] = this.message;
//     return data;
//   }
// }

// class Data {
//   int? id;
//   int? userId;
//   int? itemId;
//   String? itemName;
//   String? variant;
//   String? image;
//   int? quantity;
//   double? price;
//   String? createdAt;
//   String? updatedAt;

//   Data(
//       {this.id,
//       this.userId,
//       this.itemId,
//       this.itemName,
//       this.variant,
//       this.image,
//       this.quantity,
//       this.price,
//       this.createdAt,
//       this.updatedAt});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     itemId = json['item_id'];
//     itemName = json['item_name'];
//     variant = json['variant'];
//     image = json['image'];
//     quantity = json['quantity'];
//     price = json['price'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['item_id'] = this.itemId;
//     data['item_name'] = this.itemName;
//     data['variant'] = this.variant;
//     data['image'] = this.image;
//     data['quantity'] = this.quantity;
//     data['price'] = this.price;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }


import 'dart:convert';

SalesMyCartListModel SalesMyCartListModelFromJson(String str) => SalesMyCartListModel.fromJson(json.decode(str));

String SalesMyCartListModelToJson(SalesMyCartListModel data) => json.encode(data.toJson());

class SalesMyCartListModel {
    String? status;
    List<Datum>? data;
    String? message;

    SalesMyCartListModel({
        this.status,
        this.data,
        this.message,
    });

    factory SalesMyCartListModel.fromJson(Map<String, dynamic> json) => SalesMyCartListModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
    };
}

class Datum {
    int? id;
    int? userId;
    dynamic? sellerId;
    int? itemId;
    String? itemName;
    String? variant;
    String? image;
    int? quantity;
    double? price;
    DateTime? createdAt;
    DateTime? updatedAt;

    Datum({
        this.id,
        this.userId,
        this.sellerId,
        this.itemId,
        this.itemName,
        this.variant,
        this.image,
        this.quantity,
        this.price,
        this.createdAt,
        this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        sellerId: json["seller_id"],
        itemId: json["item_id"],
        itemName: json["item_name"],
        variant: json["variant"],
        image: json["image"],
        quantity: json["quantity"],
        price: json["price"].toDouble(),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "seller_id": sellerId,
        "item_id": itemId,
        "item_name": itemName,
        "variant": variant,
        "image": image,
        "quantity": quantity,
        "price": price,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
