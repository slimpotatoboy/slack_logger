library slack_logger;

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:slack_logger/exception.dart';
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
      throw SlackLoggerException(e.toString());
    }
  }

  /// pass [imageUrl] as string which also returns Future
  /// **optional** pass [imageAltText] as string
  Future<void> sendImage({
    required String imageUrl,
    String? imageAltText,
  }) async {
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
      throw SlackLoggerException(e.toString());
    }
  }

  /// pass [text] as string which also returns Future
  /// [imageUrl] as string
  /// optional parameter [imageAltText] as string
  Future<void> sendImageWithText({
    required String text,
    required String imageUrl,
    String? imageAltText,
  }) async {
    _assertInstance();

    try {
      var postBody = jsonEncode(
        {
          "blocks": [
            {
              "type": "image",
              "title": {
                "type": "plain_text",
                "text": text,
                "emoji": true,
              },
              "image_url": imageUrl,
              "alt_text": imageAltText,
            }
          ]
        },
      );
      requestUrl(postBody);
    } catch (e) {
      throw SlackLoggerException(e.toString());
    }
  }

  /// pass [markdownMessage] as string text message,
  /// [buttonLabel] as string - button label,
  /// [url] as string - when user clicks button
  Future<void> sendTextWithButton({
    required String markdownMessage,
    required String buttonLabel,
    required String url,
  }) async {
    _assertInstance();

    try {
      var postBody = jsonEncode(
        {
          "blocks": [
            {
              "type": "section",
              "text": {
                "type": "mrkdwn",
                "text": markdownMessage,
              },
              "accessory": {
                "type": "button",
                "text": {
                  "type": "plain_text",
                  "text": buttonLabel,
                  "emoji": true
                },
                "value": "click_me_123",
                "url": url,
                "action_id": "button-action"
              }
            }
          ]
        },
      );
      requestUrl(postBody);
    } catch (e) {
      throw SlackLoggerException(e.toString());
    }
  }

  /// pass [message] as string text message as attachment in slack,
  Future<void> sendTextAsAttachment(String message) async {
    _assertInstance();

    try {
      var postBody = jsonEncode({
        "attachments": [
          {
            "blocks": [
              {
                "type": "section",
                "text": {"type": "plain_text", "text": message, "emoji": true}
              }
            ]
          }
        ]
      });
      requestUrl(postBody);
    } catch (e) {
      throw SlackLoggerException(e.toString());
    }
  }

  /// pass [markdownMessageList] as List of String markdown
  /// pass [color] as String (HEX)
  /// It'll show as attachments in slack
  Future<void> sendMarkdownAsAttachment({
    required List<String> markdownMessageList,
    required String color,
  }) async {
    _assertInstance();

    try {
      dynamic values;
      List<dynamic> listOfValues = [];
      for (var i = 0; i < markdownMessageList.length; i++) {
        values = {
          "type": "section",
          "text": {
            "type": "mrkdwn",
            "text": markdownMessageList[i],
          }
        };
        listOfValues.add(values);
      }
      var postBody = jsonEncode({
        "attachments": [
          {
            "color": color,
            "blocks": listOfValues,
          }
        ]
      });

      requestUrl(postBody);
    } catch (e) {
      throw SlackLoggerException(e.toString());
    }
  }

  static void _assertInstance() {
    assert(
      _instance != null,
      "[SlackLogger] instance needs to be created first.",
    );
  }
}
