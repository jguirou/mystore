import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/form_divider.dart';
import 'package:mystore/common/social_buttons.dart';
import 'package:mystore/presentation/sign_up/domain/controller/signup_controller.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/constants/texts.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../widgets/sign_up_form.dart';
import '../widgets/sign_up_header.dart';
import '../widgets/terms_and_conditions_checkbox.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final  controller = Get.put(SignUpController());
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: (){},
            icon: IconButton(
                onPressed: (){
                  Get.back();
                },
                icon:  Icon(Icons.arrow_back, color: dark ? AppColors.white: AppColors.dark,)
            ),
        ),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              const SignUpHeader(),
              const SizedBox(height: AppSizes.spaceBtwSections),
              /// Sign Up form
              const SignUpForm(),

              /// Terms And Conditions CheckBox
              const TermsAndConditionsCheckBox(),

              const SizedBox(height: AppSizes.spaceBtwInputField),
              /// Create account button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: ()=> controller.signup(),
                  child: const Text(AppTexts.createAccount),
                ),
              ),
              /// Divider
              const SizedBox(height: AppSizes.spaceBtwSections),
              FormDivider(dark: dark, dividerText: AppTexts.orSignUpWith.capitalize!),
              const SizedBox(height: AppSizes.spaceBtwSections),
              const SocialButtons()
            ],
          ),
        ),
      ),

    );
  }
}
