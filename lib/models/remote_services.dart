import 'dart:convert';


import 'package:eclipsis/models/fdmodel.dart';
import 'package:eclipsis/models/mfmodel.dart';
import 'package:eclipsis/models/mfmodel2.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static Future<List<Welcome>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('https://api.mfapi.in/mf');
    var response = await client.get(uri);

    var json = response.body;
    // temp = jsonDecode(json.toString());
    if (response.statusCode == 200) {
      var json = response.body;
      return welcomeFromJson(json);
    }
    return null;
  }
}

class RemoteService2 {
  static Future<FDs?> getPosts() async {
    var client = http.Client();

    var uri =
    Uri.parse('https://api.kuvera.in/fixed_deposit/api/v1/plans.json');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return FDsFromJson(json);
    }
    return null;
  }
}

class RemoteService3 {
  static Future<Welcome2?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('https://api.mfapi.in/mf');
    var response = await client.get(uri);

    var json = response.body;
    // temp = jsonDecode(json.toString());
    if (response.statusCode == 200) {
      var json = response.body;
      return Welcome2FromJson2(json);
    }
    return null;
  }
}