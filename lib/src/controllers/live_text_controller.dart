import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LiveTextController {
  LiveTextController({
    this.initialValue = "",
  }) {
    textValueNotifier = ValueNotifier<String>(initialValue);
  }

  late ValueNotifier<String> textValueNotifier;

  String initialValue;

  String get getValue => textValueNotifier.value;

  set setValue(String updatedValue) {
    textValueNotifier.value = updatedValue;
  }

  void resetValue() {
    setValue = initialValue;
  }
}
