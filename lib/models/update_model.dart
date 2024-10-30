// To parse this JSON data, do
//
//     final updateModel = updateModelFromJson(jsonString);

import 'dart:convert';

UpdateModel updateModelFromJson(String str) =>
    UpdateModel.fromJson(json.decode(str));

String updateModelToJson(UpdateModel data) => json.encode(data.toJson());

class UpdateModel {
  int? change;
  int? shop;
  int? idn;
  String? city;
  double? price1;
  double? price2;
  dynamic accepted;

  UpdateModel({
    this.change,
    this.shop,
    this.idn,
    this.city,
    this.price1,
    this.price2,
    this.accepted,
  });

  factory UpdateModel.fromJson(Map<String, dynamic> json) => UpdateModel(
        change: json["change"],
        shop: json["shop"],
        idn: json["idn"],
        city: json["city"],
        price1: json["price1"],
        price2: json["price2"],
        accepted: json["accepted"],
      );

  Map<String, dynamic> toJson() => {
        "change": change,
        "shop": shop,
        "idn": idn,
        "city": city,
        "price1": price1,
        "price2": price2,
        "accepted": accepted,
      };
}
