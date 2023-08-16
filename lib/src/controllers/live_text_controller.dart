import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LiveTextController {
  String _oldValue = "";

  ///Provides new value
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

  ///Returns current value of text
  String get getValue => textValueNotifier.value;

  ///Called when the new value assigned to text.
  void Function(String oldValue, String newValue)? onValueChanged;

  ///Sets new value to text
  set setValue(String updatedValue) {
    _oldValue = textValueNotifier.value;
    _newValue = updatedValue;
    textValueNotifier.value = updatedValue;
  }

  ///Resets initial value of text
  void resetValue() {
    setValue = initialValue;
  }
}
