# Slack Logger

[![GitHub stars](https://img.shields.io/github/stars/slimpotatoboy/slack_logger.svg?style=social)](https://github.com/slimpotatoboy/slack_logger)

[![Follow Twitter](https://img.shields.io/twitter/follow/slimpotatoboy?style=social)](https://twitter.com/intent/follow?screen_name=slimpotatoboy)

A simple dart package to send message to slack channel via slack webhook

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