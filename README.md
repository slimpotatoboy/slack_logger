# Slack Logger 🚀

[![GitHub stars](https://img.shields.io/github/stars/slimpotatoboy/slack_logger.svg?style=social)](https://github.com/slimpotatoboy/slack_logger)

[![Follow Twitter](https://img.shields.io/twitter/follow/slimpotatoboy?style=social)](https://twitter.com/intent/follow?screen_name=slimpotatoboy)

A simple Flutter package to send message to slack channel via slack webhook

## Usage

To use this plugin, add `slack_logger` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/platform-integration/platform-channels) 🔗.

### Steps before using this package

- Add Apps to 🔗 https://api.slack.com/apps/.

- Go to Incoming Webhook Link and Enable it.

- Create your slack channel.

- Create new webhook and link slack channel.

### You are good to go now 👍

### Initialize [SlackLogger]

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    SlackLogger(webhookUrl: "[Add Your Web Hook Url]");

    return MaterialApp(
      ...
    );
  }
}
```

#### Send Message:

```dart
final slack = SlackLogger.instance;

...

slack.send("This is a error log to my channel");

...
```

#### Send Image:

```dart
final slack = SlackLogger.instance;

...

slack.sendImage("[image url]", "[alt text for image]");

...
```
#### Send Image With Text Block:

```dart
final slack = SlackLogger.instance;

...

slack.sendImageWithText("[text]","[image url]", "[alt text for image]");

...
```

#### Send Text (Markdown) with Button:

```dart
final slack = SlackLogger.instance;

...

slack.sendTextWithButton("[markdown message]","[button label]", "[button link]");

...
```

## 🚀 Contributors
- [Dipen Maharjan](https://dipenmaharjan.com.np/)
- [Ashim Upadhaya](https://github.com/ayyshim)
**Any new Contributors are welcomed.**

Feel Free to request any missing features or report issues [here](https://github.com/slimpotatoboy/slack_logger/issues) 🔗.
