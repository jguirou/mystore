import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mystore/presentation/login/ui/screen/login_screen.dart';


class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();

  /// variables
  final pageController = PageController();
  Rx<int> currentIndex = 0.obs;

  /// Update current index when page scroll
  void updatePageIndicator(index)=> currentIndex.value = index;

  /// Jump to the specific dot selected page
  void dotNavigationClick(index){
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }


  /// Update current index & jump to next page
  void nextPage(){

    if(currentIndex.value == 2 ){
      final storage = GetStorage();

      if(kDebugMode){
        print(" ================= Get Storage Auth Repo ============= ");
        print(storage.read('IsFirstTime'));
      }
      storage.write('IsFirstTime', false);
      if(kDebugMode){
        print("  ================= Get Storage Auth Repo ============= ");
        print(storage.read('IsFirstTime'));
      }

      Get.offAll(()=> const LoginScreen());

    } else {
      int page = currentIndex.value + 1;
      dotNavigationClick(page);
    }
  }

  /// Update current index & jump to last page
  void skipPage(){
    currentIndex.value = 2;
    pageController.jumpToPage(2);
  }
}