// To parse this JSON data, do
//
//     final Welcome2 = Welcome2FromJson2(jsonString);

import 'dart:convert';

Welcome2 Welcome2FromJson2(String str) => Welcome2.fromJson(json.decode(str));

String Welcome2ToJson2(Welcome2 data) => json.encode(data.toJson());

class Welcome2 {
  Welcome2({
    required this.meta,
    required this.data,
    required this.status,
  });

  Meta meta;
  List<Datum> data;
  String status;

  factory Welcome2.fromJson(Map<String, dynamic> json) => Welcome2(
        meta: Meta.fromJson(json["meta"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
      };
}

class Datum {
  Datum({
    required this.date,
    required this.nav,
  });

  String date;
  String nav;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        date: json["date"],
        nav: json["nav"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "nav": nav,
      };
}

class Meta {
  Meta({
    required this.fundHouse,
    required this.schemeType,
    required this.schemeCategory,
    required this.schemeCode,
    required this.schemeName,
  });

  String fundHouse;
  String schemeType;
  String schemeCategory;
  int schemeCode;
  String schemeName;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        fundHouse: json["fund_house"],
        schemeType: json["scheme_type"],
        schemeCategory: json["scheme_category"],
        schemeCode: json["scheme_code"],
        schemeName: json["scheme_name"],
      );

  Map<String, dynamic> toJson() => {
        "fund_house": fundHouse,
        "scheme_type": schemeType,
        "scheme_category": schemeCategory,
        "scheme_code": schemeCode,
        "scheme_name": schemeName,
      };
}
