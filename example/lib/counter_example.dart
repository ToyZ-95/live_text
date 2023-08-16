import 'package:flutter/material.dart';
import 'package:live_text/live_text.dart';

class CounterExample extends StatelessWidget {
  CounterExample({super.key});

  LiveTextController counterLiveTextController = LiveTextController(
      initialValue: "0",
      onValueChanged: (String oldValue, String newValue) {
        print("Counter");
        print("Old Value $oldValue");
        print("New Value $newValue");
      });

  void _incrementCounter() {
    counterLiveTextController.setValue =
        (int.parse(counterLiveTextController.getValue) + 1).toString();
  }

  void _decrementCounter() {
    counterLiveTextController.setValue =
        (int.parse(counterLiveTextController.getValue) - 1).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Counter"),
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
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    const Spacer(),
                    FloatingActionButton(
                      onPressed: _decrementCounter,
                      tooltip: 'Decrement',
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(width: 10),
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
    );
  }
}
