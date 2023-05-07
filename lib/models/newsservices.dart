import 'package:app1/models/newsmodel.dart';
import 'package:http/http.dart' as http;

class NewServiceMarket {
  static Future<News?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://www.alphavantage.co/query?function=NEWS_SENTIMENT&topics=financial_markets&apikey=ZTF5S6178QWI906O');
    var response = await client.get(uri, headers: {'User-Agent': 'request'});
    if (response.statusCode == 200) {
      var json = response.body;
      return NewsFromJson(json);
    }
    return null;
  }
}

class NewServiceEconomy {
  static Future<News?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://www.alphavantage.co/query?function=NEWS_SENTIMENT&topics=economy_monetary&apikey=ZTF5S6178QWI906O');
    var response = await client.get(uri, headers: {'User-Agent': 'request'});
    if (response.statusCode == 200) {
      var json = response.body;
      return NewsFromJson(json);
    }
    return null;
  }
}

class NewServiceTech {
  static Future<News?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://www.alphavantage.co/query?function=NEWS_SENTIMENT&topics=technology&apikey=ZTF5S6178QWI906O');
    var response = await client.get(uri, headers: {'User-Agent': 'request'});
    if (response.statusCode == 200) {
      var json = response.body;
      return NewsFromJson(json);
    }
    return null;
  }
}

class NewServiceAll {
  static Future<News?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://www.alphavantage.co/query?function=NEWS_SENTIMENT&apikey=ZTF5S6178QWI906O');
    var response = await client.get(uri, headers: {'User-Agent': 'request'});
    if (response.statusCode == 200) {
      var json = response.body;
      return NewsFromJson(json);
    }
    return null;
  }
}
