library slack_logger;

import 'dart:convert';
import 'package:http/http.dart' as http;

class SlackLogger {
  static Future send(String webhookUrl, String message) async {
    try {
      var postBody = jsonEncode({"text": message});
      Uri url = Uri.parse(webhookUrl);
      final response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: postBody,
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
