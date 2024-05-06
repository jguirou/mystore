import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/presentation/forgot_password/domain/controller/forgot_password_controller.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../account_created/ui/screen/success_screen.dart';
import '../../../login/ui/screen/login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: (){
                Get.offAll(()=> const LoginScreen());

              }, icon: const Icon(Icons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(

          padding:  const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// Image asset
              const Image(
                alignment: Alignment.center,
                image: AssetImage(AppImages.deliveredEmailIllustration),
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              Text(AppTexts.changePasswordTitle.capitalize!, style: Theme.of(context).textTheme.headlineMedium),

              const SizedBox(height: AppSizes.spaceBtwItems),
              Text(email!, style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Text(AppTexts.changePasswordSubTitle, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),
              const SizedBox(height: AppSizes.spaceBtwSections),

              /// Continue Button next page
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    Get.to(()=>  SuccessScreen(
                        title: AppTexts.yourAccountCreatedTitle,
                        subTile: AppTexts.yourAccountCreatedSubTitle,
                        image: AppImages.staticSuccessIllustration,
                        onPressed: ()=> Get.to(()=>const LoginScreen())
                    ));
                  },
                  child:const  Text(AppTexts.myStoreDone),
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),

              /// Resend email button
              TextButton(
                onPressed: ()=> ForgotPasswordController.instance.reSendPasswordResetEmail(email!),
                child: const Text(AppTexts.resendEmail),
              ),

            ], 
          ),
        ),
      ),
    );
  }
}
