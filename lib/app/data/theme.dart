import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackbarCustom(String snackMessage) {
  Get.rawSnackbar(
    message: snackMessage,
    snackPosition: SnackPosition.TOP,
    margin: EdgeInsets.all(16),
    borderRadius: 50,
  );
}
