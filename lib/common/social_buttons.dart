import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/presentation/login/domain/controller/login_controller.dart';

import '../utils/constants/colors.dart';
import '../utils/constants/image_strings.dart';
import '../utils/constants/sizes.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () => controller.googleSigIn(),
              icon: const Image(
                height: AppSizes.iconMd,
                width: AppSizes.iconMd,
                image: AssetImage(AppImages.google),
              )),
        ),
        const SizedBox(
          width: AppSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                height: AppSizes.iconMd,
                width: AppSizes.iconMd,
                image: AssetImage(AppImages.facebook),
              )),
        ),
      ],
    );
  }
}
