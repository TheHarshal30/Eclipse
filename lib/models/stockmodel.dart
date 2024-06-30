// To parse this JSON data, do
//
//     final stocks = stocksFromJson(jsonString);

import 'dart:convert';

Stocks stocksFromJson(String str) => Stocks.fromJson(json.decode(str));

String stocksToJson(Stocks data) => json.encode(data.toJson());

class Stocks {
  String metadata;
  String lastUpdated;
  List<MostActivelyTraded> topGainers;
  List<MostActivelyTraded> topLosers;
  List<MostActivelyTraded> mostActivelyTraded;

  Stocks({
    required this.metadata,
    required this.lastUpdated,
    required this.topGainers,
    required this.topLosers,
    required this.mostActivelyTraded,
  });

  factory Stocks.fromJson(Map<String, dynamic> json) => Stocks(
        metadata: json["metadata"],
        lastUpdated: json["last_updated"],
        topGainers: List<MostActivelyTraded>.from(
            json["top_gainers"].map((x) => MostActivelyTraded.fromJson(x))),
        topLosers: List<MostActivelyTraded>.from(
            json["top_losers"].map((x) => MostActivelyTraded.fromJson(x))),
        mostActivelyTraded: List<MostActivelyTraded>.from(
            json["most_actively_traded"]
                .map((x) => MostActivelyTraded.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "metadata": metadata,
        "last_updated": lastUpdated,
        "top_gainers": List<dynamic>.from(topGainers.map((x) => x.toJson())),
        "top_losers": List<dynamic>.from(topLosers.map((x) => x.toJson())),
        "most_actively_traded":
            List<dynamic>.from(mostActivelyTraded.map((x) => x.toJson())),
      };
}

class MostActivelyTraded {
  String ticker;
  String price;
  String changeAmount;
  String changePercentage;
  String volume;

  MostActivelyTraded({
    required this.ticker,
    required this.price,
    required this.changeAmount,
    required this.changePercentage,
    required this.volume,
  });

  factory MostActivelyTraded.fromJson(Map<String, dynamic> json) =>
      MostActivelyTraded(
        ticker: json["ticker"],
        price: json["price"],
        changeAmount: json["change_amount"],
        changePercentage: json["change_percentage"],
        volume: json["volume"],
      );

  Map<String, dynamic> toJson() => {
        "ticker": ticker,
        "price": price,
        "change_amount": changeAmount,
        "change_percentage": changePercentage,
        "volume": volume,
      };
}
