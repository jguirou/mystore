import 'package:get/get.dart';

class HomeController extends GetxController{
  static HomeController get instance => Get.find();
  final Rx<int> carousalCurrentIndex  = 0.obs;

  void updatePageIndicator(index){
    carousalCurrentIndex.value = index;
  }
}