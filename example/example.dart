import 'package:flutter/material.dart';
import 'package:slack_logger/slack_logger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SlackLogger(webhookUrl: "[Add Your Web Hook Url]");

    return MaterialApp(
      title: 'Slack Logger Example',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Slack Logger Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final SlackLogger _slack = SlackLogger.instance;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    // send message to slack
    _slack.send(
      "Count $_counter Added",
    );
  }

  /// send image to slack
  void _sendThisImage() {
    _slack.sendImage(
      "https://dipenmaharjan.com.np/assets/png/Thumbnail.png",
      "Dipen Maharjan",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Image.network(
                "https://dipenmaharjan.com.np/assets/png/Thumbnail.png"),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              onPressed: _sendThisImage,
              child: const Text("Send This Image"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
