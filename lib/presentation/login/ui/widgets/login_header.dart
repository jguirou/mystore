import 'package:flutter/material.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
          height: 150,
          image: AssetImage(AppImages.lightAppLogo),
        ),
        const SizedBox(
          height: AppSizes.defaultSpace,
        ),
        Text(
          AppTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: AppSizes.sm,
        ),
        Text(
          AppTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
      ],
    );
  }
}
