import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/presentation/shop/home/cart/ui/screen/cart_screen.dart';
import 'package:mystore/common/shimmers/custom_shimmer.dart';

import '../../../../../../common/appBar/app_bar.dart';
import '../../../../../../common/products_card/card_counter_icon.dart';
import '../../../../../../domain/controller/user_controller.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/texts.dart';


class HomeAppBar extends StatelessWidget  {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
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
          Obx(
            (){
              if(controller.profileLoading.value){
                // Show a shimmer loader while user profile is being loaded
                return const CustomShimmerEffects(width: 80, height: 15);
              } else {
                return Text(
                  controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: AppColors.white),
                );
              }

            }
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