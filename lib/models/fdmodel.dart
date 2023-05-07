// To parse this JSON data, do
//
//     final FDs = FDsFromJson(jsonString);

import 'dart:convert';

FDs FDsFromJson(String str) => FDs.fromJson(json.decode(str));

String FDsToJson(FDs data) => json.encode(data.toJson());

class FDs {
  FDs({
    required this.data,
  });

  List<Datum> data;

  factory FDs.fromJson(Map<String, dynamic> json) => FDs(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.type,
    required this.attributes,
  });

  String id;
  String type;
  Attributes attributes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        type: json["type"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  Attributes({
    required this.name,
    required this.riskLevel,
    required this.partnerId,
    required this.interestRate,
    required this.seniorCitizenInterestRate,
    this.offerCode,
    required this.tenureFrom,
    required this.tenureTo,
    required this.tenureFromInMonths,
    required this.tenureToInMonths,
    this.startDate,
    this.endDate,
    required this.minAmount,
    required this.compounding,
    required this.maxAmount,
    required this.status,
    required this.lockinPeriod,
  });

  String name;
  String riskLevel;
  String partnerId;
  num interestRate;
  num seniorCitizenInterestRate;
  dynamic offerCode;
  num tenureFrom;
  num tenureTo;
  num tenureFromInMonths;
  num tenureToInMonths;
  dynamic startDate;
  dynamic endDate;
  String minAmount;
  String compounding;
  String maxAmount;
  String status;
  String lockinPeriod;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        name: json["name"],
        riskLevel: json["risk_level"],
        partnerId: json["partner_id"],
        interestRate: json["interest_rate"],
        seniorCitizenInterestRate: json["senior_citizen_interest_rate"],
        offerCode: json["offer_code"],
        tenureFrom: json["tenure_from"],
        tenureTo: json["tenure_to"],
        tenureFromInMonths: json["tenure_from_in_months"],
        tenureToInMonths: json["tenure_to_in_months"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        minAmount: json["min_amount"],
        compounding: json["compounding"],
        maxAmount: json["max_amount"],
        status: json["status"],
        lockinPeriod: json["lockin_period"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "risk_level": riskLevel,
        "partner_id": partnerId,
        "interest_rate": interestRate,
        "senior_citizen_interest_rate": seniorCitizenInterestRate,
        "offer_code": offerCode,
        "tenure_from": tenureFrom,
        "tenure_to": tenureTo,
        "tenure_from_in_months": tenureFromInMonths,
        "tenure_to_in_months": tenureToInMonths,
        "start_date": startDate,
        "end_date": endDate,
        "min_amount": minAmount,
        "compounding": compounding,
        "max_amount": maxAmount,
        "status": status,
        "lockin_period": lockinPeriod,
      };
}
