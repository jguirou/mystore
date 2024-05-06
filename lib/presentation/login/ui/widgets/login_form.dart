import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/navigation_menu.dart';
import 'package:mystore/presentation/forgot_password/ui/screen/forgot_password_screen.dart';
import 'package:mystore/presentation/sign_up/ui/screen/sign_up_screen.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../domain/login_controller/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key, required this.emailController, required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwSections),
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email), labelText: AppTexts.email),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputField,
          ),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.password),
                labelText: AppTexts.password,
                suffixIcon: Icon(Icons.remove_red_eye)),
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
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
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
              onPressed: () {
                String email = emailController.text.trim();
                String password = passwordController.text.trim();
                print('email: $email: $password');
                //loginController.login(email, password);
                /// Goto email verification screen
                Get.to(()=>const NavigationMenu());

              },
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
