import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

enum TextSpanType {
  normal,
  hyperLink;

  GestureRecognizer? getCurrentRecognizer(String text) {
    return switch (this) {
      TextSpanType.normal => null,
      TextSpanType.hyperLink =>
      TapGestureRecognizer()
        ..onTap = () {
          final Uri url = Uri.parse(text);
          launchUrl(url);
        }
    };
  }
}