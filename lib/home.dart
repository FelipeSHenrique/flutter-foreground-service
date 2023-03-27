import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _text = "Stop service";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                FlutterBackgroundService().invoke('setAsForeground');
              },
              child: const Text("Foreground Service"),
            ),
            ElevatedButton(
              onPressed: () {
                FlutterBackgroundService().invoke('setAsBackground');
              },
              child: const Text("Background Service"),
            ),
            ElevatedButton(
              onPressed: () async {
                final service = FlutterBackgroundService();
                bool isRunning = await service.isRunning();
                if (isRunning) {
                  service.invoke('stopService');
                } else {
                  service.startService();
                }
                if (!isRunning) {
                  _text = "Stop Service";
                } else {
                  _text = "Start Service";
                }
                setState(() {});
              },
              child: Text(_text),
            ),
          ],
        ),
      ),
    );
  }
}
