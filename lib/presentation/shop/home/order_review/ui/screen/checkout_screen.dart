import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/navigation_menu.dart';
import '../../../../../../common/appBar/app_bar.dart';
import '../../../../../../common/products_card/coupon_code.dart';
import '../../../../../../common/products_card/rounded_container.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/helpers/helper_functions.dart';
import '../../../../../account_created/ui/screen/success_screen.dart';
import '../../../cart/ui/widgets/cart_items.dart';
import '../widgets/billing_address_section.dart';
import '../widgets/billing_amount_section.dart';
import '../widgets/billing_payment_section.dart';

class OrderReviewScreen extends StatelessWidget {
  const OrderReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Order review'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              const CartItems(showAddRemoveButton: false,),
              const SizedBox(height: AppSizes.spaceBtwItems,),
              /// Form promo code
              const CouponCode(),
              const SizedBox(height: AppSizes.spaceBtwItems,),
              RoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(AppSizes.md),
                backgroundColor:  dark ? AppColors.black: AppColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    BillingAmountSection(),
                    SizedBox(height: AppSizes.spaceBtwItems,),
                    /// Divider
                    Divider(),
                    SizedBox(height: AppSizes.spaceBtwItems,),
                    /// Payments methods
                    BillingPaymentSection(),
                    SizedBox(height: AppSizes.spaceBtwItems,),

                    /// Address
                    BillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: (){
            Get.to(()=>  SuccessScreen(
                title: 'Payment success',
                subTile: 'Your item will be shipped soon!',
                image: AppImages.staticSuccessIllustration,
                onPressed: ()=> Get.offAll(()=>const NavigationMenu())
            ));
          },
          child: const Text("Checkout \$256"),
        ),
      ),
    );
  }
}

