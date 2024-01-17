import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart' if (kIsWeb) 'dart:html' as html;

class BackMethod {
  static back(BuildContext context) {
    if (GetPlatform.isMobile) {
      Navigator.pop(context);
    } else {
      html.window.history.back();
    }
  }
}
