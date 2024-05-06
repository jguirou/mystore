import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

class Loaders{
  static hideSnackBar()=> ScaffoldMessenger.of(Get.overlayContext!).hideCurrentSnackBar();
  static customToast({required  message}){
    ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
      SnackBar(
        elevation: 0,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.transparent,

          content: Container(
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: HelperFunctions.isDarkMode(Get.overlayContext!) ? AppColors.darkGrey.withOpacity(0.9): AppColors.grey.withOpacity(0.9),
            ),
            child: Center(
              child: Text(
                message,
                style: Theme.of(Get.overlayContext!).textTheme.labelLarge,
              ),
            ),
          )),
        );
  }
  static successSnackBar({required title, message = '', duration= 3}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: AppColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Icons.check, color: AppColors.white),
    );
  }

  static warningSnackBar({required title, message = ''}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Icons.warning, color: AppColors.white),
    );
  }

  static errorSnackBar({required title, message = ''}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Icons.warning, color: AppColors.white),
    );
  }
}