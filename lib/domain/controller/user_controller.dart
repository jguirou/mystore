import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mystore/common/loaders/loaders.dart';
import 'package:mystore/domain/repositories/user/user_repository.dart';

import '../entities/user/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  Future<void> saveUserRecord(UserCredential? userCredential) async {

    try{
      if(userCredential != null){
        // Convert name to first and last name
        final nameParts  = UserModel.nameParts(userCredential.user?.displayName ?? '');
        final userName = UserModel.generateUserName(userCredential.user?.displayName ?? '');

        // Map data
        final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ?  nameParts.sublist(1).join(' '): '',
            username: userName,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '');


        // Save user data
        await userRepository.saveUserRecord(user);

      }

    } catch (e){
      Loaders.warningSnackBar(
          title: 'Data not saved',
        message: 'Something went wrong while saving your information. You can re-save your data in your profile.'
      );
    }
  }
}