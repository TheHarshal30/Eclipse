// To parse this JSON data, do
//
//     final News = NewsFromJson(jsonString);

import 'dart:convert';

News NewsFromJson(String str) => News.fromJson(json.decode(str));

String NewsToJson(News data) => json.encode(data.toJson());

class News {
  News({
    required this.items,
    required this.sentimentScoreDefinition,
    required this.relevanceScoreDefinition,
    required this.feed,
  });

  String? items;
  String? sentimentScoreDefinition;
  String? relevanceScoreDefinition;
  List<Feed> feed;

  factory News.fromJson(Map<String, dynamic> json) => News(
        items: json["items"],
        sentimentScoreDefinition: json["sentiment_score_definition"],
        relevanceScoreDefinition: json["relevance_score_definition"],
        feed: List<Feed>.from(json["feed"].map((x) => Feed.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": items,
        "sentiment_score_definition": sentimentScoreDefinition,
        "relevance_score_definition": relevanceScoreDefinition,
        "feed": List<dynamic>.from(feed.map((x) => x.toJson())),
      };
}

class Feed {
  Feed({
    required this.title,
    required this.url,
    required this.timePublished,
    required this.authors,
    required this.summary,
    this.bannerImage,
    required this.source,
    required this.categoryWithinSource,
    required this.sourceDomain,
    required this.topics,
    required this.overallSentimentScore,
    required this.overallSentimentLabel,
    required this.tickerSentiment,
  });

  String title;
  String url;
  String timePublished;
  List<String> authors;
  String summary;
  String? bannerImage;
  String source;
  String categoryWithinSource;
  String sourceDomain;
  List<Topic> topics;
  double overallSentimentScore;
  SentimentLabel overallSentimentLabel;
  List<TickerSentiment> tickerSentiment;

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        title: json["title"],
        url: json["url"],
        timePublished: json["time_published"],
        authors: List<String>.from(json["authors"].map((x) => x)),
        summary: json["summary"],
        bannerImage: json["banner_image"],
        source: json["source"],
        categoryWithinSource: json["category_within_source"],
        sourceDomain: json["source_domain"],
        topics: List<Topic>.from(json["topics"].map((x) => Topic.fromJson(x))),
        overallSentimentScore: json["overall_sentiment_score"]?.toDouble(),
        overallSentimentLabel:
            sentimentLabelValues.map[json["overall_sentiment_label"]]!,
        tickerSentiment: List<TickerSentiment>.from(
            json["ticker_sentiment"].map((x) => TickerSentiment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
        "time_published": timePublished,
        "authors": List<dynamic>.from(authors.map((x) => x)),
        "summary": summary,
        "banner_image": bannerImage,
        "source": source,
        "category_within_source": categoryWithinSource,
        "source_domain": sourceDomain,
        "topics": List<dynamic>.from(topics.map((x) => x.toJson())),
        "overall_sentiment_score": overallSentimentScore,
        "overall_sentiment_label":
            sentimentLabelValues.reverse[overallSentimentLabel],
        "ticker_sentiment":
            List<dynamic>.from(tickerSentiment.map((x) => x.toJson())),
      };
}

enum SentimentLabel {
  NEUTRAL,
  SOMEWHAT_BULLISH,
  SOMEWHAT_BEARISH,
  BULLISH,
  BEARISH
}

final sentimentLabelValues = EnumValues({
  "Bearish": SentimentLabel.BEARISH,
  "Bullish": SentimentLabel.BULLISH,
  "Neutral": SentimentLabel.NEUTRAL,
  "Somewhat-Bearish": SentimentLabel.SOMEWHAT_BEARISH,
  "Somewhat-Bullish": SentimentLabel.SOMEWHAT_BULLISH
});

class TickerSentiment {
  TickerSentiment({
    required this.ticker,
    required this.relevanceScore,
    required this.tickerSentimentScore,
    required this.tickerSentimentLabel,
  });

  String ticker;
  String relevanceScore;
  String tickerSentimentScore;
  SentimentLabel tickerSentimentLabel;

  factory TickerSentiment.fromJson(Map<String, dynamic> json) =>
      TickerSentiment(
        ticker: json["ticker"],
        relevanceScore: json["relevance_score"],
        tickerSentimentScore: json["ticker_sentiment_score"],
        tickerSentimentLabel:
            sentimentLabelValues.map[json["ticker_sentiment_label"]]!,
      );

  Map<String, dynamic> toJson() => {
        "ticker": ticker,
        "relevance_score": relevanceScore,
        "ticker_sentiment_score": tickerSentimentScore,
        "ticker_sentiment_label":
            sentimentLabelValues.reverse[tickerSentimentLabel],
      };
}

class Topic {
  Topic({
    required this.topic,
    required this.relevanceScore,
  });

  String topic;
  String relevanceScore;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        topic: json["topic"],
        relevanceScore: json["relevance_score"],
      );

  Map<String, dynamic> toJson() => {
        "topic": topic,
        "relevance_score": relevanceScore,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
