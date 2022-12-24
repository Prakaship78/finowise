import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Alert {
  static errorWidget(String title) {
    return Get.showSnackbar(GetSnackBar(
      messageText: Text(
        title,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w300, color: Colors.white),
      ),
      backgroundColor: Colors.black,
      snackPosition: SnackPosition.TOP,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
      onTap: (getBar) {
        Get.back();
      },
    ));
  }
}
