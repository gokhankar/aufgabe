import 'dart:convert';

ChangeModel changeModelFromJson(String str) =>
    ChangeModel.fromJson(json.decode(str));

String changeModelToJson(ChangeModel data) => json.encode(data.toJson());

class ChangeModel {
  int? change;
  double? price;

  ChangeModel({
    this.change,
    this.price,
  });

  factory ChangeModel.fromJson(Map<String, dynamic> json) => ChangeModel(
        change: json["change"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "change": change,
        "price": price,
      };
}
