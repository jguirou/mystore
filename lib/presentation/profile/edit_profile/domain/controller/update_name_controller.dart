import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/domain/controller/user_controller.dart';
import 'package:mystore/domain/repositories/user/user_repository.dart';
import 'package:mystore/presentation/profile/edit_profile/ui/screens/edit_profile_screen.dart';

import '../../../../../common/loaders/loaders.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/popup/full_screen_loader.dart';
import '../../../../sign_up/domain/controller/signup_controller.dart';
import '../../../profile/ui/screen/profile_screen.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  final userController = UserController.instance;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    initializedNames();
    super.onInit();
  }

  // fetch user record;
  Future<void> initializedNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  void updateUserName()async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog(
          "We are updating your information..", AppImages.productImage1);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }


      Map<String, dynamic> name = {'firstName': firstName.text.trim(),'lastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();
      // remove loader
      FullScreenLoader.stopLoading();

      Loaders.successSnackBar(title: 'Congratulations', message: 'Your name has been updated.');

      // Move to previous screen
      Get.off(()=> const EditProfileScreen());
    } catch (e) {
      // remove loader
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}