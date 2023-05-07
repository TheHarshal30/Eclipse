import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.schemeCode,
    required this.schemeName,
  });

  int schemeCode;
  String schemeName;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        schemeCode: json["schemeCode"],
        schemeName: json["schemeName"],
      );

  Map<String, dynamic> toJson() => {
        "schemeCode": schemeCode,
        "schemeName": schemeName,
      };
}
