import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/presentation/forgot_password/domain/controller/forgot_password_controller.dart';
import 'package:mystore/presentation/login/ui/screen/login_screen.dart';
import 'package:mystore/presentation/reset_password/ui/screen/reset_password_screen.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/validators/validation.dart';

import '../../../../utils/constants/texts.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: ()=> Get.to(()=>const LoginScreen()),
              icon: const Icon(Icons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// forgot password titles && subTitles header
              Text(AppTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Text(AppTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: AppSizes.spaceBtwSections * 2),
              /// Form
              /// email fields
              Form(
                key: controller.forgotPasswordFormKey,
                  child: TextFormField(
                    controller: controller.email,
                    validator: (value)=> Validator.validateEmail(value),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: AppTexts.email,

                    ),
                  )
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),

              /// Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: ()=> controller.sendPasswordResetEmail(),
                    child: const Text(AppTexts.submit)
                ),
              ),





            ],
          ),
        ),
      ),
    );
  }
}
