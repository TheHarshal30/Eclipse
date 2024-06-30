// TODO: Replace YOUR_API_KEY with your API key.
import 'dart:convert';
import 'package:http/http.dart' as http;

// import 'package:kpkwk/logic/localllm.dart';

String haikus = "";
bool itsHere = false;

class Llm {
  Future<String?> getPoems(String productName) async {
    print("getPoems working");
    var apiKey = 'AIzaSyDY_0KuvRG_XYM1Tezeyej-n-sBdVvMvI8';
    const haikuCount = 1;

    final url = Uri.parse(
        'https://generativelanguage.googleapis.com/v1beta2/models/chat-bison-001:generateMessage?key=$apiKey');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      "prompt": {
        "context":
            "You are a Financial Advisor. Help in planning out finances to achieve finance goals",
        "messages": [
          {"content": "${productName} "}
        ]
      },
      "candidate_count": haikuCount,
      "temperature": 0.7,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        haikus = '';
        for (var i = 0; i < haikuCount; i++) {
          haikus += decodedResponse['candidates'][i]['content'] + '\n\n';
        }
        print(haikus);
        itsHere = true;
        return haikus;
      } else {
        return haikus;
      }
    } catch (error) {
      return haikus;
    }
    return haikus;
  }
}
