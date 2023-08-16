<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

<a href="https://www.buymeacoffee.com/patelasad4u" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 40px !important;width: 150px !important;" ></a>

[![pub package](https://img.shields.io/pub/v/live_text?style=flat-square&logo=flutter&color=blue)](https://pub.dev/packages/live_text)


# :star: Updating Text widget made simple :star: 

Have you stumble upon a situations where you simply need to update UI text without dealing with state management techniques? If so, this package is a perfect fit for you.


## Features

- [X] Updates text without any hassle.
- [X] Provides call back with old and new value of your text widget.
- [X] Reset to initial value whenever you want.

## Getting started

Add live_text to your pubspec.yaml file and start making your text live.

## Installation

Just add `live_text` as a [dependency in your pubspec.yaml file](https://flutter.io/using-packages/).

```yaml
dependencies:
  live_text: <Latest Version>
```
 </br>

## Usage

```dart
  import 'package:live_text/live_text.dart';
```
 </br>

 ## Simple counter example.
 <img src="https://github.com/ToyZ-95/live_text/raw/main/example/assets/counter.gif" width="250" height="500"/>
 
  - Create LiveTextController instance 
      ```dart
      LiveTextController counterLiveTextController = LiveTextController(initialValue: "0");
     ```
  - Create LiveText widget and provide LiveTextController that we just created
    ```dart
     LiveText(
                style: Theme.of(context).textTheme.headlineMedium,
                liveTextController: counterLiveTextController,
              ),
    ```
  - Now provide following call backs on increase and decrease button
    ```dart
      void _incrementCounter() {
    counterLiveTextController.setValue =
        (int.parse(counterLiveTextController.getValue) + 1).toString();
    }
    
     void _decrementCounter() {
      counterLiveTextController.setValue =
          (int.parse(counterLiveTextController.getValue) - 1).toString();
    }
    ```

 ## Timer example.
  <img src="https://github.com/ToyZ-95/live_text/raw/main/example/assets/timer.gif" width="250" height="500"/>
 
  - Following is the full example code for Timer app using live_text

```dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:live_text/live_text.dart';

class TimerExample extends StatelessWidget {
  TimerExample({super.key});

  late LiveTextController timerLiveTextController = LiveTextController(
      initialValue: "00:00",
      onValueChanged: (String oldValue, String newValue) {
        print("Timer");

        print("Old Value $oldValue");
        print("New Value $newValue");
      });

  Timer? timer;

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
        title: const Text("Timer"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              const Spacer(),
              LiveText(
                style: Theme.of(context).textTheme.headlineLarge,
                liveTextController: timerLiveTextController,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    const Spacer(),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
  
## Additional information

We will be more than happy for your contributions.
<br />
Please contribute to [live_text](https://github.com/ToyZ-95/live_text) this github repo.
