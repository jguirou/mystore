import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/appBar/app_bar.dart';
import 'package:mystore/domain/controller/user_controller.dart';
import 'package:mystore/utils/constants/sizes.dart';

import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/validators/validation.dart';

class ReAuthenticateUserLoginForm extends StatelessWidget {
  const ReAuthenticateUserLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Re-Authenticate User',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: Validator.validateEmail,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_circle),
                      labelText: AppTexts.email.capitalize!),
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwInputField,
                ),
                Obx(
                      ()=> TextFormField(
                    controller: controller.verifyPassword,
                    obscureText: controller.hidePassword.value,
                    validator: (value) => Validator.validatePassword(value),
                    decoration:  InputDecoration(
                        prefixIcon: const Icon(Icons.password),
                        labelText: AppTexts.password,
                        suffixIcon: IconButton(onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value, icon: Icon( controller.hidePassword.value ? Icons.visibility_off : Icons.visibility ))),
                  ),
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwSections,
                ),
                /// Sign In button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: ()=> controller.reAuthenticateEmailAndPasswordUser(),
                    child: const Text('Verify'),
                  ),
                ),

              ],
            )),
      ),
    );
  }
}
