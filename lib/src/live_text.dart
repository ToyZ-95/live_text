import 'package:flutter/material.dart';
import 'package:live_text/src/controllers/live_text_controller.dart';

class LiveText extends StatelessWidget {
  const LiveText({
    super.key,
    required this.liveTextController,
    this.style,
  });

  final TextStyle? style;
  final LiveTextController liveTextController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: liveTextController.textValueNotifier,
      builder: (BuildContext context, String value, _) {
        return Text(
          value,
          style: style,
        );
      },
    );
  }
}
