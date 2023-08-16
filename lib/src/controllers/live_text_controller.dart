import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LiveTextController {
  String _oldValue = "";
  String _newValue = "";

  LiveTextController({
    this.initialValue = "",
    this.onValueChanged,
  }) : textValueNotifier = ValueNotifier<String>(initialValue) {
    _oldValue = initialValue;

    if (onValueChanged != null) {
      textValueNotifier.addListener(() {
        onValueChanged!(_oldValue, _newValue);
      });
    }
  }

  late ValueNotifier<String> textValueNotifier;

  String initialValue;

  String get getValue => textValueNotifier.value;

  void Function(String oldValue, String newValue)? onValueChanged;

  set setValue(String updatedValue) {
    _oldValue = textValueNotifier.value;
    _newValue = updatedValue;
    textValueNotifier.value = updatedValue;
  }

  void resetValue() {
    setValue = initialValue;
  }
}
