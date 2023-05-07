// To parse this JSON data, do
//
//     final MFNAV = MFNAVFromJson(jsonString);

import 'dart:convert';

List<MFNAV> MFNAVFromJson(String str) =>
    List<MFNAV>.from(json.decode(str).map((x) => MFNAV.fromJson(x)));

String MFNAVToJson(List<MFNAV> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MFNAV {
  MFNAV({
    required this.schemeCode,
    required this.isinDivPayoutIsinGrowth,
    required this.isinDivReinvestment,
    required this.schemeName,
    required this.netAssetValue,
    required this.date,
    required this.schemeType,
    required this.schemeCategory,
  });

  String schemeCode;
  String isinDivPayoutIsinGrowth;
  String isinDivReinvestment;
  String schemeName;
  String netAssetValue;
  String date;
  SchemeType schemeType;
  String schemeCategory;

  factory MFNAV.fromJson(Map<String, dynamic> json) => MFNAV(
        schemeCode: json["Scheme Code"],
        isinDivPayoutIsinGrowth: json["ISIN Div Payout/ISIN Growth"],
        isinDivReinvestment: json["ISIN Div Reinvestment"],
        schemeName: json["Scheme Name"],
        netAssetValue: json["Net Asset Value"],
        date: json["Date"],
        schemeType: schemeTypeValues.map[json["Scheme Type"]]!,
        schemeCategory: json["Scheme Category"],
      );

  Map<String, dynamic> toJson() => {
        "Scheme Code": schemeCode,
        "ISIN Div Payout/ISIN Growth": isinDivPayoutIsinGrowth,
        "ISIN Div Reinvestment": isinDivReinvestment,
        "Scheme Name": schemeName,
        "Net Asset Value": netAssetValue,
        "Date": date,
        "Scheme Type": schemeTypeValues.reverse[schemeType],
        "Scheme Category": schemeCategory,
      };
}

enum MutualFundFamily {
  NIPPON_INDIA_MUTUAL_FUND,
  SUNDARAM_MUTUAL_FUND,
  ICICI_PRUDENTIAL_MUTUAL_FUND,
  IL_FS_MUTUAL_FUND_IDF,
  UTI_MUTUAL_FUND,
  PGIM_INDIA_MUTUAL_FUND,
  IIFCL_MUTUAL_FUND_IDF,
  FRANKLIN_TEMPLETON_MUTUAL_FUND,
  KOTAK_MAHINDRA_MUTUAL_FUND,
  ADITYA_BIRLA_SUN_LIFE_MUTUAL_FUND,
  HSBC_MUTUAL_FUND,
  BANK_OF_INDIA_MUTUAL_FUND,
  MAHINDRA_MANULIFE_MUTUAL_FUND,
  UNION_MUTUAL_FUND,
  EDELWEISS_MUTUAL_FUND,
  HDFC_MUTUAL_FUND,
  AXIS_MUTUAL_FUND,
  SBI_MUTUAL_FUND,
  IDFC_MUTUAL_FUND,
  JM_FINANCIAL_MUTUAL_FUND,
  LIC_MUTUAL_FUND,
  TATA_MUTUAL_FUND,
  INDIABULLS_MUTUAL_FUND,
  SHRIRAM_MUTUAL_FUND,
  ITI_MUTUAL_FUND,
  BARODA_BNP_PARIBAS_MUTUAL_FUND,
  INVESCO_MUTUAL_FUND,
  IDBI_MUTUAL_FUND,
  MIRAE_ASSET_MUTUAL_FUND,
  IIFL_MUTUAL_FUND,
  CANARA_ROBECO_MUTUAL_FUND,
  DSP_MUTUAL_FUND,
  MOTILAL_OSWAL_MUTUAL_FUND,
  NAVI_MUTUAL_FUND,
  PPFAS_MUTUAL_FUND,
  QUANT_MUTUAL_FUND,
  QUANTUM_MUTUAL_FUND,
  TRUST_MUTUAL_FUND,
  WHITE_OAK_CAPITAL_MUTUAL_FUND,
  NJ_MUTUAL_FUND,
  SAMCO_MUTUAL_FUND,
  TAURUS_MUTUAL_FUND
}

final mutualFundFamilyValues = EnumValues({
  "Aditya Birla Sun Life Mutual Fund":
      MutualFundFamily.ADITYA_BIRLA_SUN_LIFE_MUTUAL_FUND,
  "Axis Mutual Fund": MutualFundFamily.AXIS_MUTUAL_FUND,
  "Bank of India Mutual Fund": MutualFundFamily.BANK_OF_INDIA_MUTUAL_FUND,
  "Baroda BNP Paribas Mutual Fund":
      MutualFundFamily.BARODA_BNP_PARIBAS_MUTUAL_FUND,
  "Canara Robeco Mutual Fund": MutualFundFamily.CANARA_ROBECO_MUTUAL_FUND,
  "DSP Mutual Fund": MutualFundFamily.DSP_MUTUAL_FUND,
  "Edelweiss Mutual Fund": MutualFundFamily.EDELWEISS_MUTUAL_FUND,
  "Franklin Templeton Mutual Fund":
      MutualFundFamily.FRANKLIN_TEMPLETON_MUTUAL_FUND,
  "HDFC Mutual Fund": MutualFundFamily.HDFC_MUTUAL_FUND,
  "HSBC Mutual Fund": MutualFundFamily.HSBC_MUTUAL_FUND,
  "ICICI Prudential Mutual Fund": MutualFundFamily.ICICI_PRUDENTIAL_MUTUAL_FUND,
  "IDBI Mutual Fund": MutualFundFamily.IDBI_MUTUAL_FUND,
  "IDFC Mutual Fund": MutualFundFamily.IDFC_MUTUAL_FUND,
  "IIFCL Mutual Fund (IDF)": MutualFundFamily.IIFCL_MUTUAL_FUND_IDF,
  "IIFL Mutual Fund": MutualFundFamily.IIFL_MUTUAL_FUND,
  "IL&FS Mutual Fund (IDF)": MutualFundFamily.IL_FS_MUTUAL_FUND_IDF,
  "Indiabulls Mutual Fund": MutualFundFamily.INDIABULLS_MUTUAL_FUND,
  "Invesco Mutual Fund": MutualFundFamily.INVESCO_MUTUAL_FUND,
  "ITI Mutual Fund": MutualFundFamily.ITI_MUTUAL_FUND,
  "JM Financial Mutual Fund": MutualFundFamily.JM_FINANCIAL_MUTUAL_FUND,
  "Kotak Mahindra Mutual Fund": MutualFundFamily.KOTAK_MAHINDRA_MUTUAL_FUND,
  "LIC Mutual Fund": MutualFundFamily.LIC_MUTUAL_FUND,
  "Mahindra Manulife Mutual Fund":
      MutualFundFamily.MAHINDRA_MANULIFE_MUTUAL_FUND,
  "Mirae Asset Mutual Fund": MutualFundFamily.MIRAE_ASSET_MUTUAL_FUND,
  "Motilal Oswal Mutual Fund": MutualFundFamily.MOTILAL_OSWAL_MUTUAL_FUND,
  "Navi Mutual Fund": MutualFundFamily.NAVI_MUTUAL_FUND,
  "Nippon India Mutual Fund": MutualFundFamily.NIPPON_INDIA_MUTUAL_FUND,
  "NJ Mutual Fund": MutualFundFamily.NJ_MUTUAL_FUND,
  "PGIM India Mutual Fund": MutualFundFamily.PGIM_INDIA_MUTUAL_FUND,
  "PPFAS Mutual Fund": MutualFundFamily.PPFAS_MUTUAL_FUND,
  "Quantum Mutual Fund": MutualFundFamily.QUANTUM_MUTUAL_FUND,
  "quant Mutual Fund": MutualFundFamily.QUANT_MUTUAL_FUND,
  "Samco Mutual Fund": MutualFundFamily.SAMCO_MUTUAL_FUND,
  "SBI Mutual Fund": MutualFundFamily.SBI_MUTUAL_FUND,
  "Shriram Mutual Fund": MutualFundFamily.SHRIRAM_MUTUAL_FUND,
  "Sundaram Mutual Fund": MutualFundFamily.SUNDARAM_MUTUAL_FUND,
  "Tata Mutual Fund": MutualFundFamily.TATA_MUTUAL_FUND,
  "Taurus Mutual Fund": MutualFundFamily.TAURUS_MUTUAL_FUND,
  "Trust Mutual Fund": MutualFundFamily.TRUST_MUTUAL_FUND,
  "Union Mutual Fund": MutualFundFamily.UNION_MUTUAL_FUND,
  "UTI Mutual Fund": MutualFundFamily.UTI_MUTUAL_FUND,
  "WhiteOak Capital Mutual Fund": MutualFundFamily.WHITE_OAK_CAPITAL_MUTUAL_FUND
});

enum SchemeType {
  INTERVAL_FUND_SCHEMES,
  CLOSE_ENDED_SCHEMES,
  OPEN_ENDED_SCHEMES
}

final schemeTypeValues = EnumValues({
  "Close Ended Schemes": SchemeType.CLOSE_ENDED_SCHEMES,
  "Interval Fund Schemes": SchemeType.INTERVAL_FUND_SCHEMES,
  "Open Ended Schemes": SchemeType.OPEN_ENDED_SCHEMES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
