library slack_logger;

import 'dart:convert';
import 'package:http/http.dart' as http;

class SlackLogger {
  static SlackLogger? _instance;
  static SlackLogger get instance {
    _assertInstance();
    return _instance!;
  }

  factory SlackLogger({
    required String webhookUrl,
  }) {
    _instance = SlackLogger._internal(webhookUrl);

    return _instance!;
  }

  SlackLogger._internal(this.webhookUrl);

  final String webhookUrl;

  Future send(String message) async {
    _assertInstance();

    try {
      var postBody = jsonEncode({"text": message});
      Uri url = Uri.parse(_instance!.webhookUrl);
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

  static void _assertInstance() {
    assert(
      _instance != null,
      "[SlackLogger] instance needs to be created first.",
    );
  }
}
