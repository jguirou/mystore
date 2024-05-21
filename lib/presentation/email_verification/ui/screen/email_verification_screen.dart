import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/domain/repositories/authentication/authentication_repository.dart';
import 'package:mystore/presentation/email_verification/domain/controller/email_verification_controller.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EmailVerificationController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: ()=> AuthenticationRepository.instance.logout(), icon: const Icon(Icons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(

          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// Image asset
              const Image(
                alignment: Alignment.center,
                image: AssetImage(AppImages.deliveredEmailIllustration),
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              Text(AppTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium),

              const SizedBox(height: AppSizes.spaceBtwItems),
              Text(email ?? '', style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Text(AppTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),
              const SizedBox(height: AppSizes.spaceBtwSections),

              /// Continue Button next page
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: ()=> controller.checkEmailVerificationStatus(),
                    child:const  Text(AppTexts.myStoreContinue),
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),

              /// Resend email button
              TextButton(
                  onPressed: ()=> controller.sendEmailVerification(),
                  child: const Text(AppTexts.resendEmail),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
