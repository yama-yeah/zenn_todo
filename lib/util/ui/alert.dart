import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void showAlert(BuildContext context) {
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      Alert(
        context: context,
        type: AlertType.warning,
        title: "通知の設定",
        desc: "通知を有効にしてください",
        buttons: [
          DialogButton(
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              AwesomeNotifications().requestPermissionToSendNotifications();
              Navigator.pop(context);
            },
            width: 120,
          )
        ],
      ).show();
    }
  });
}
