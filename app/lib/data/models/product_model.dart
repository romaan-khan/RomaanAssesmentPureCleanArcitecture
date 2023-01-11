// To parse this JSON data, do
//
//     final bannerData = bannerDataFromJson(jsonString);

import 'dart:convert';

ProductData bannerDataFromJson(String str) => ProductData.fromJson(json.decode(str));

String bannerDataToJson(ProductData data) => json.encode(data.toJson());

class ProductData {
  ProductData({
    required this.status,
    required this.msg,
    required this.data,
  });

  bool status;
  String msg;
  List<ProductDatum> data;

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
    status: json["status"],
    msg: json["msg"],
    data: List<ProductDatum>.from(json["data"].map((x) => ProductDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ProductDatum {
  ProductDatum({
    required this.id,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.has_product,
  });

  int id;
  dynamic image;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic has_product;

  factory ProductDatum.fromJson(Map<String, dynamic> json) => ProductDatum(
    id: json["id"],
    image: json["image"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    has_product: json["has_product"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "has_product": has_product,
  };
}
