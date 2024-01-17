import 'package:flutter/material.dart';

class CommonText {
  static Text textBoldWeight400({
    required String text,
    double? fontSize,
    Color? color,
    String? fontFamily,
    int? maxLine,
    height = 1.0,
    TextAlign? textAlign = TextAlign.start,
    FontWeight fontWeight = FontWeight.w400,
    TextOverflow textOverflow = TextOverflow.ellipsis,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLine,
      overflow: textOverflow,
      style: TextStyle(
        height: height,
        decoration: textDecoration,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text textBoldWeight500({
    required String text,
    double? fontSize,
    Color? color,
    String? fontFamily,
    height = 1.0,
    int? maxLine,
    TextAlign? textAlign = TextAlign.start,
    TextOverflow textOverflow = TextOverflow.ellipsis,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return Text(
      text,
      maxLines: maxLine,
      overflow: textOverflow,
      textAlign: textAlign,
      style: TextStyle(
        height: height,
        fontWeight: FontWeight.w500,
        decoration: textDecoration,
        fontSize: fontSize,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text textBoldWeight600({
    required String text,
    double? fontSize,
    String? fontFamily,
    Color? color,
    int? maxLine,
    double height = 1.0,
    TextAlign textAlign = TextAlign.start,
    TextOverflow textOverflow = TextOverflow.ellipsis,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return Text(
      text,
      maxLines: maxLine,
      overflow: textOverflow,
      textAlign: textAlign,
      style: TextStyle(
        height: height,
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
        decoration: textDecoration,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text textBoldWeight700(
      {required String text,
      double? fontSize,
      String? fontFamily,
      Color? color,
      height = 1.0,
      int? maxLine,
      TextAlign textAlign = TextAlign.start,
      FontWeight fontWeight = FontWeight.w700,
      TextOverflow textOverflow = TextOverflow.ellipsis,
      TextDecoration textDecoration = TextDecoration.none}) {
    return Text(
      text,
      maxLines: maxLine,
      textAlign: textAlign,
      overflow: textOverflow,
      style: TextStyle(
        height: height,
        fontWeight: fontWeight,
        fontSize: fontSize,
        decoration: textDecoration,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static TextStyle textStyleCommon({
    double? fontSize,
    Color? color,
    String? fontFamily,
    int maxLine = 1,
    height = 0.0,
    TextAlign? textAlign,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
    );
  }
}
