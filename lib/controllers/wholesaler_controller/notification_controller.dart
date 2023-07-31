import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/notificationModel.dart';

import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class WholeNotificationController extends GetxController {
  // notification
  String getNotificationUrl = '${Constants.GET_USER_NOTIFICATION}';
  NotificationModel? wholeNotificationModel;
  bool notificationLoaded = false;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() async {
    try {
      // banners
      wholeNotificationModel = NotificationModel.fromJson(
          await ApiHelper.getApi(getNotificationUrl));
      print(wholeNotificationModel);
      notificationLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
