import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/styles/spacing_style.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/texts.dart';
import '../../../../common/form_divider.dart';
import '../../domain/controller/login_controller.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';
import '../../../../common/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final  controller = Get.put(LoginController());
    final dark = HelperFunctions.isDarkMode(context);

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// logo, title & subtitle
              const LoginHeader(),
              /// Form
               const LoginForm(),

              /// or sign in with Divider
              FormDivider(dark: dark, dividerText: AppTexts.orSignInWith.capitalize!,),
              const SizedBox(height: AppSizes.spaceBtwSections,),

              /// Footer
              const SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}








