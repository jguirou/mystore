import 'package:flutter/material.dart';
import 'package:mystore/presentation/on_boarding/on_boarding_controller/on_boarding_controller.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: DeviceUtils.getAppBarHeight(),
        right: AppSizes.defaultSpace,
        child: TextButton(
          child: const Text('Skip'),
          onPressed: () => OnBoardingController.instance.skipPage(),
        ));
  }
}