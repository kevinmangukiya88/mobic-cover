import 'package:flutter/cupertino.dart';

extension AddSpace on num {
  Widget SizedBoxHeight() {
    return SizedBox(
      height: toDouble(),
    );
  }

  Widget SizedBoxWidth() {
    return SizedBox(
      width: toDouble(),
    );
  }
}
