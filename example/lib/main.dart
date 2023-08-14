import 'dart:async';

import 'package:flutter/material.dart';
import 'package:live_text/live_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Text Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late LiveTextController counterLiveTextController;
  late LiveTextController timerLiveTextController;

  Timer? timer;

  @override
  void initState() {
    super.initState();
    counterLiveTextController = LiveTextController(
      initialValue: "0",
    );
    timerLiveTextController = LiveTextController(initialValue: "00:00");
  }

  void _incrementCounter() {
    if (int.parse(counterLiveTextController.getValue) == 5) {
      counterLiveTextController.resetValue();
    } else {
      counterLiveTextController.setValue =
          (int.parse(counterLiveTextController.getValue) + 1).toString();
    }
  }

  void _toggleTimer() {
    if (timer == null) {
      DateTime futureTime = DateTime.now().add(const Duration(seconds: 120));

      timer ??= Timer.periodic(const Duration(milliseconds: 100), (_) {
        DateTime latestTime = DateTime.now();
        if (latestTime.isBefore(futureTime)) {
          timerLiveTextController.setValue =
              formatHHMMSS(futureTime.difference(latestTime).inSeconds);
        } else {
          _clearTimer();
        }
      });
    } else {
      _clearTimer();
    }
  }

  void _clearTimer() {
    timer?.cancel();
    timer = null;
    timerLiveTextController.resetValue();
  }

  String formatHHMMSS(int seconds) {
    final hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    final minutes = (seconds / 60).truncate();

    final hoursStr = (hours).toString().padLeft(2, '0');
    final minutesStr = (minutes).toString().padLeft(2, '0');
    final secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      return '$minutesStr:$secondsStr';
    }

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Live Text"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              const Spacer(),
              const Text(
                'You have pushed the button this many times:',
              ),
              LiveText(
                style: Theme.of(context).textTheme.headlineMedium,
                liveTextController: counterLiveTextController,
              ),
              const SizedBox(height: 10),
              LiveText(
                style: Theme.of(context).textTheme.bodyLarge,
                liveTextController: timerLiveTextController,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    FloatingActionButton(
                      onPressed: _toggleTimer,
                      tooltip: 'Start Timer',
                      child: const Icon(Icons.timer_outlined),
                    ),
                    const SizedBox(width: 10),
                    FloatingActionButton(
                      onPressed: _clearTimer,
                      tooltip: 'Start Timer',
                      child: const Icon(Icons.timer_off_outlined),
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      onPressed: _incrementCounter,
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: Row(
      //   children: [
      //     const Spacer(),
      //     FloatingActionButton(
      //       onPressed: _toggleTimer,
      //       tooltip: 'Start Timer',
      //       child: const Icon(Icons.timer_outlined),
      //     ),
      //     const SizedBox(width: 10),
      //     FloatingActionButton(
      //       onPressed: _toggleTimer,
      //       tooltip: 'Start Timer',
      //       child: const Icon(Icons.timer_off_outlined),
      //     ),
      //     const Spacer(),
      //     FloatingActionButton(
      //       onPressed: _incrementCounter,
      //       tooltip: 'Increment',
      //       child: const Icon(Icons.add),
      //     ),
      //   ],
      // ),
    );
  }
}
