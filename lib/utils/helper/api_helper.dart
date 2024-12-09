import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiHelper {
  Future<List<Map<String, String>>?> translateLangAPI() async {
    String link = "https://ai-translate.p.rapidapi.com/languages";
    http.Response res = await http.get(
      Uri.parse(link),
      headers: {
        "x-rapidapi-host": "ai-translate.p.rapidapi.com",
        "x-rapidapi-key": "7fdba83299mshb0c0b4b0f829e9ep103e25jsn6950abcd98cf",
      },
    );

    if (res.statusCode == 200) {
      List<Map<String, dynamic>> json = jsonDecode(res.body);
      List<Map<String, String>> languages = json
          .map(
            (e) => {"d": e.values.toString()},
          )
          .toList();

      log('$json');
      return languages;
    }
    return null;
  }

  Future<String?> translateAPI(String text) async {
    String link = "https://ai-translate.p.rapidapi.com/translate";

    Map m1 = {
      "texts": ["$text"],
      "tl": "hi",
      "sl": "auto"
    };

    var res = await http.post(
      Uri.parse(link),
      headers: {
        "Content-Type": "application/json",
        "x-rapidapi-host": "ai-translate.p.rapidapi.com",
        "x-rapidapi-key": "7fdba83299mshb0c0b4b0f829e9ep103e25jsn6950abcd98cf",
      },
      body: jsonEncode(m1),
    );
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(utf8.decode(res.bodyBytes));

      List<dynamic> l1 = jsonData['texts'];
      return l1[0];
    }
    return null;
  }
}
