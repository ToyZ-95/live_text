import 'package:flutter/material.dart';
import 'package:live_text/src/controllers/live_text_controller.dart';

class LiveText extends StatelessWidget {
  const LiveText({
    super.key,
    required this.liveTextController,
    this.style,
    this.locale,
    this.maxLines,
    this.overflow,
    this.selectionColor,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  });

  final LiveTextController liveTextController;

  final TextStyle? style;

  final Locale? locale;

  final int? maxLines;

  final TextOverflow? overflow;

  final Color? selectionColor;

  final String? semanticsLabel;

  final bool? softWrap;

  final StrutStyle? strutStyle;

  final TextAlign? textAlign;

  final TextDirection? textDirection;

  final TextHeightBehavior? textHeightBehavior;

  final double? textScaleFactor;

  final TextWidthBasis? textWidthBasis;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: liveTextController.textValueNotifier,
      builder: (BuildContext context, String value, _) {
        return Text(
          value,
          style: style,
          locale: locale,
          maxLines: maxLines,
          overflow: overflow,
          selectionColor: selectionColor,
          semanticsLabel: semanticsLabel,
          softWrap: softWrap,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          textHeightBehavior: textHeightBehavior,
          textScaleFactor: textScaleFactor,
          textWidthBasis: textWidthBasis,
        );
      },
    );
  }
}
