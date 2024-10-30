// // To parse this JSON data, do
// //
// //     final sorteModel = sorteModelFromJson(jsonString);

// import 'dart:convert';

// SorteModel sorteModelFromJson(String str) =>
//     SorteModel.fromJson(json.decode(str));

// String sorteModelToJson(SorteModel data) => json.encode(data.toJson());

// class SorteModel {
//   int? sorte;
//   int? sorind;
//   int? artnr;
//   int? arind;
//   double? hoehe;
//   double? tiefe;
//   double? kvp;
//   double? wxl;
//   double? breite;
//   int? kzvend;
//   String? mdebez2;
//   int? ekz;

//   SorteModel({
//     this.sorte,
//     this.sorind,
//     this.artnr,
//     this.arind,
//     this.hoehe,
//     this.tiefe,
//     this.kvp,
//     this.wxl,
//     this.breite,
//     this.kzvend,
//     this.mdebez2,
//     this.ekz,
//   });

//   factory SorteModel.fromJson(Map<String, dynamic> json) => SorteModel(
//         sorte: json["sorte"],
//         sorind: json["sorind"],
//         artnr: json["artnr"],
//         arind: json["arind"],
//         hoehe: json["hoehe"],
//         tiefe: json["tiefe"],
//         kvp: json["kvp"],
//         wxl: json["wxl"],
//         breite: json["breite"],
//         kzvend: json["kzvend"],
//         mdebez2: json["mdebez2"],
//         ekz: json["ekz"],
//       );

//   Map<String, dynamic> toJson() => {
//         "sorte": sorte,
//         "sorind": sorind,
//         "artnr": artnr,
//         "arind": arind,
//         "hoehe": hoehe,
//         "tiefe": tiefe,
//         "kvp": kvp,
//         "wxl": wxl,
//         "breite": breite,
//         "kzvend": kzvend,
//         "mdebez2": mdebez2,
//         "ekz": ekz,
//       };
// }
