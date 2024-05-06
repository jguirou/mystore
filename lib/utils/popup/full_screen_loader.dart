import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../common/loaders/animation_loader.dart';

/// A utility for managing a full screen loading dialog.
class FullScreenLoader {
  /// Open a full screen loading dialog with a given text and animation.
  /// This method doesn't retunr anything.
  ///
  /// Parameters:
  ///  - text: The text to be displayed below the animation.
  ///  - animation: The path to the lottie animation file.
  static openLoadingDialog(String text, String animation){
    showDialog(
        context: Get.overlayContext!,

      barrierDismissible: false,
      builder: (_)=> PopScope(
      canPop: false,
        child: Container(
          color: HelperFunctions.isDarkMode(Get.context!) ? AppColors.dark: AppColors.white,
          width: double.infinity,
          //height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              AnimationLoaderWidget(text: text, animation: animation),

            ],
          ),
        )
    ),
    );
  }

  /// Stop the currently open loading dialog.
  /// This method doesn't return anything.
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}