library slack_logger;

import 'dart:convert';
import 'package:slack_logger/utils/request_url.dart';

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

  /// base url of slack webhook
  final String webhookUrl;

  /// pass [message] as string which also returns Future
  Future send(String message) async {
    _assertInstance();

    try {
      var postBody = jsonEncode({"text": message});
      requestUrl(postBody);
    } catch (e) {
      return e.toString();
    }
  }

  /// pass [imageUrl] as string which also returns Future
  Future sendImage(String imageUrl, [String? imageAltText]) async {
    _assertInstance();

    try {
      var postBody = jsonEncode(
        {
          "blocks": [
            {
              "type": "image",
              "image_url": imageUrl,
              "alt_text": imageAltText,
            }
          ]
        },
      );
      requestUrl(postBody);
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
