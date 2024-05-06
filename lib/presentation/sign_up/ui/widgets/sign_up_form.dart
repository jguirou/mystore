import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/presentation/sign_up/domain/controller/signup_controller.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';
import 'package:mystore/utils/validators/validation.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = SignUpController.instance;
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => Validator.validateEmptyText(
                      value, AppTexts.firstName.capitalize!),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_circle_outlined),
                      labelText: AppTexts.firstName.capitalize!),
                ),
              ),
              const SizedBox(width: AppSizes.spaceBtwInputField),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => Validator.validateEmptyText(
                      value, AppTexts.lastName.capitalize!),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_circle_outlined),
                      labelText: AppTexts.lastName.capitalize!),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBtwInputField),
          TextFormField(
            controller: controller.username,
            validator: (value) => Validator.validateEmptyText(
                value, AppTexts.username.capitalize!),
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.account_circle),
                labelText: AppTexts.username.capitalize!),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputField),
          TextFormField(
            controller: controller.email,
            validator: (value) => Validator.validateEmail(value),
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.account_circle),
                labelText: AppTexts.email.capitalize!),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputField),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => Validator.validatePhoneNumber(value),
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.account_circle),
                labelText: AppTexts.phoneNo.capitalize!),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputField),
          Obx(
            ()=> TextFormField(
              obscureText: controller.hidePassword.value,
              controller: controller.password,
              validator: (value) => Validator.validatePassword(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.account_circle),
                labelText: AppTexts.password.capitalize!,
                suffixIcon: IconButton(
                  onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value,

                  icon:   Icon( controller.hidePassword.value ? Icons.visibility_off: Icons.visibility),
                  color: dark ? AppColors.darkGrey : AppColors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
