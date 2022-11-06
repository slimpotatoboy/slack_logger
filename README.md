# Slack Logger

[![GitHub stars](https://img.shields.io/github/stars/slimpotatoboy/slack_logger.svg?style=social)](https://github.com/slimpotatoboy/slack_logger)

A simple package to send message to slack channel

## Usage
To use this plugin, add `slack_logger` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/platform-integration/platform-channels).

### Steps before using this package

* Add Apps to https://api.slack.com/apps/.

* Go to Incoming Webhook Link and Enable it.

* Create your slack channel.

* Create new webhook and link slack channel.


### You are good to go now 👍

#### Send:


```dart
SlackLogger.send(
    "[url from web hook]",
    "This is a error log to my channel",
);
```

Feel Free to request any missing features or report issues [here](https://github.com/slimpotatoboy/slack_logger/issues).