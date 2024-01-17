import 'package:flutter/material.dart';
import 'package:mobic_cover/constant/app_colors.dart';

class CommonElevatedButton extends StatelessWidget {
  const CommonElevatedButton(
      {Key? key,
      required this.text,
      this.onPressed,
      this.width,
      this.bgColor,
      this.textColor,
      this.fontSize,
      this.height,
      this.fontFamily = 'Roboto',
      this.fontWeight = FontWeight.w700})
      : super(key: key);
  final String text;
  final String fontFamily;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final Color? bgColor;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
        onPressed: onPressed == null ? null : onPressed,
        child: Text(
          style: TextStyle(
              fontSize: fontSize,
              fontFamily: fontFamily,
              fontWeight: fontWeight,
              color: textColor),
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class CommonOutlineBorderButton extends StatelessWidget {
  const CommonOutlineBorderButton(
      {Key? key,
      required this.text,
      this.onPressed,
      this.width,
      this.height,
      this.textColor,
      this.fontWeight = FontWeight.w500,
      this.fontSize = 10,
      this.fontFamily = 'Roboto',
      this.buttonBorderColor = AppColors.blackColor,
      this.bgColor})
      : super(key: key);
  final String text;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final Color? textColor, bgColor;
  final Color? buttonBorderColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width ?? 110,
        height: height ?? 24,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: buttonBorderColor!,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontSize,
              fontFamily: fontFamily,
              fontWeight: fontWeight,
              color: textColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
