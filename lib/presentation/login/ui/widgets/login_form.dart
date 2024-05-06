import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mystore/navigation_menu.dart';
import 'package:mystore/presentation/forgot_password/ui/screen/forgot_password_screen.dart';
import 'package:mystore/presentation/sign_up/ui/screen/sign_up_screen.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/validators/validation.dart';
import '../../domain/controller/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key, required this.emailController, required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final  controller = Get.put(LoginController());
    return Form(
      key: controller.loginKey,
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwSections),
      child: Column(
        children: [
          TextFormField(
            controller: controller.email,
            validator: (value) => Validator.validateEmail(value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email), labelText: AppTexts.email),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputField,
          ),
          Obx(
            ()=> TextFormField(
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              validator: (value) => Validator.validatePassword(value),
              decoration:  InputDecoration(
                  prefixIcon: const Icon(Icons.password),
                  labelText: AppTexts.password,
                  suffixIcon: IconButton(onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value, icon: Icon( controller.hidePassword.value ? Icons.visibility_off : Icons.visibility ))),
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputField / 2,
          ),

          /// Remember me & forget password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Remember me
              Row(
                children: [
                  Obx(
              ()=> Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (value) => controller.rememberMe.value = value!,
                    ),
                  ),
                  const Text(AppTexts.rememberMe),
                ],
              ),

              /// forget password
              TextButton(
                  onPressed: ()=> Get.to(()=> const ForgotPasswordScreen()), child: const Text(AppTexts.forgetPassword))
            ],
          ),
          const SizedBox(
            height: AppSizes.spaceBtwSections, 
          ),

          /// Sign In button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.login(),
              child: const Text(AppTexts.signIn),
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputField,
          ),

          /// Create account button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                Get.to(() => const SignUpScreen());
              },
              child: const Text(AppTexts.createAccount),
            ),
          ),
        ],
      ),
    ));
  }
}
