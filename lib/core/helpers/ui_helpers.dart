import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

mixin UiAlerts {
  static void showSuccessNotification(String message) {
    showSimpleNotification(
        Text(
          message,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: '',
              fontSize: 16,),
        ),
        slideDismissDirection: DismissDirection.up,
        background: Colors.green,
        duration: const Duration(seconds: 2),
    );
  }

  static void showErrorNotification(String message) {
    showSimpleNotification(
        Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: '',
            fontSize: 16,
          ),
        ),
        slideDismissDirection: DismissDirection.up,
        background: Colors.red,
        duration: const Duration(seconds: 2),
    );
  }
}
