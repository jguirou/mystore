import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/presentation/shop/home/cart/ui/screen/cart_screen.dart';

import '../../../../../../common/appBar/app_bar.dart';
import '../../../../../../common/products_card/card_counter_icon.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/texts.dart';


class HomeAppBar extends StatelessWidget  {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.homeAppBarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: AppColors.grey),
          ),
          Text(
            AppTexts.homeAppBarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: AppColors.white),
          )
        ],
      ),
      actions: [
        CartCounterIcon(
          onPressed: ()=> Get.to(()=>const CartScreen()),
          iconColor: AppColors.white,
        )
      ],
    );
  }
}