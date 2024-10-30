import 'dart:convert';

ShopModel shopModelFromJson(String str) => ShopModel.fromJson(json.decode(str));

String shopModelToJson(ShopModel data) => json.encode(data.toJson());

class ShopModel {
  int? shop;
  String? name1;
  String? name2;
  String? str;
  String? plz;
  String? ort;

  ShopModel({
    this.shop,
    this.name1,
    this.name2,
    this.str,
    this.plz,
    this.ort,
  });

  factory ShopModel.fromJson(Map<String, dynamic> json) => ShopModel(
        shop: json["shop"],
        name1: json["name1"],
        name2: json["name2"],
        str: json["str"],
        plz: json["plz"],
        ort: json["ort"],
      );

  Map<String, dynamic> toJson() => {
        "shop": shop,
        "name1": name1,
        "name2": name2,
        "str": str,
        "plz": plz,
        "ort": ort,
      };
}
