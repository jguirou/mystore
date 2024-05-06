import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/appBar/app_bar.dart';

import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../order_review/ui/screen/checkout_screen.dart';
import '../widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text('Cart'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: ()=> Get.to(()=> const OrderReviewScreen()),
          child: const Text("Checkout \$256"),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: CartItems(),
        ),
      ),
    );
  }
}




