import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mystore/presentation/sign_up/domain/controller/signup_controller.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/texts.dart';
class TermsAndConditionsCheckBox extends StatelessWidget {
  const TermsAndConditionsCheckBox({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = SignUpController.instance;
    return Row(
      children: [
        Obx(
        ()=> Checkbox(
            value: controller.privacyPolicy.value,
            onChanged: (value)=> controller.privacyPolicy.value = value!),
        ),
        RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                      text: '${AppTexts.iAgreeTo} ',
                      style: Theme.of(context).textTheme.labelMedium
                  ),
                  TextSpan(
                    text: AppTexts.privacyPolicy,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(decoration: TextDecoration.underline, color: dark ? AppColors.white :AppColors.primary, decorationColor: dark ? AppColors.white :AppColors.primary ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {

                      },
                  ),
                  TextSpan(
                      text: ' and ',
                      style: Theme.of(context).textTheme.labelMedium
                  ),
                  TextSpan(
                    text: AppTexts.termsOfUse,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(decoration: TextDecoration.underline, color: dark ? AppColors.white :AppColors.primary, decorationColor: dark ? AppColors.white :AppColors.primary),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {

                      },
                  ),
                ]
            )
        )
      ],
    );
  }
}