import 'package:flutter/material.dart';
import 'package:mystore/presentation/on_boarding/on_boarding_controller/on_boarding_controller.dart';
import 'package:mystore/utils/constants/colors.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Positioned(
        right: AppSizes.defaultSpace,
        bottom: DeviceUtils.getBottomNavigationBarHeight()+25,
        child: ElevatedButton(

          style: ElevatedButton.styleFrom(side: BorderSide(color: dark ? AppColors.primary: Colors.black ), shape:  CircleBorder(side: BorderSide(color: dark ? AppColors.primary: Colors.black )), backgroundColor: dark ? AppColors.primary: Colors.black,),
          onPressed: () => OnBoardingController.instance.nextPage(),
          child: const Icon(Icons.arrow_forward_ios),

        )
    );
  }
}