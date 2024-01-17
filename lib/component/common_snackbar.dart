import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonSnackBar {
  static Duration duration = Duration(seconds: 5);
  static getSuccessSnackBar(BuildContext context, String message) {
    return GetPlatform.isMobile
        ? ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                message,
                maxLines: 5,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.green,
              duration: duration,
              behavior: SnackBarBehavior.floating,
              showCloseIcon: true,
              closeIconColor: Colors.white,
            ),
          )
        : ElegantNotification.success(
            width: 400,
            title: Text("Successfully"),
            description: Text(
              '$message',
            ),
          ).show(context);
  }

  static getFailedSnackBar(BuildContext context, String message) {
    return GetPlatform.isMobile
        ? ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                message,
                maxLines: 5,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.red,
              duration: duration,
              behavior: SnackBarBehavior.floating,
              showCloseIcon: true,
              closeIconColor: Colors.white,
            ),
          )
        : ElegantNotification.error(
            width: 400,
            title: Text("Failed"),
            description: Text(
              '$message',
            ),
          ).show(context);
  }

  static getWarningSnackBar(BuildContext context, String message) {
    return GetPlatform.isMobile
        ? ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                message,
                maxLines: 5,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.red,
              duration: duration,
              behavior: SnackBarBehavior.floating,
              showCloseIcon: true,
              closeIconColor: Colors.white,
            ),
          )
        : ElegantNotification.info(
            width: 400,
            title: Text("Warning"),
            description: Text(
              '$message',
            ),
          ).show(context);
  }
}
