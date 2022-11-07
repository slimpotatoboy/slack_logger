import 'package:http/http.dart' as http;
import 'package:slack_logger/slack_logger.dart';

Future requestUrl(String postBody) async {
  Uri url = Uri.parse(SlackLogger.instance.webhookUrl);
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
}
