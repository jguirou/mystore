import 'package:flutter/material.dart';

import '../../../../../../common/products_card/cart_item.dart';
import '../../../../../../common/products_card/quantity_with_add_remmove_button.dart';
import '../../../../../../common/texts/product_price_text.dart';
import '../../../../../../utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (__, ___) =>
      const SizedBox(height: AppSizes.spaceBtwSections),
      itemCount: 3,
      itemBuilder: (_, index) =>  Column(
        children: [
          const CartItem(),
          if(showAddRemoveButton) const SizedBox(height: AppSizes.spaceBtwItems,),
          if(showAddRemoveButton)
            const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 70,),
              QuantityWithAddRemoveButton(),
              ProductPriceText(price: '134'),

            ],
          ),

        ],
      ),
    );
  }
}
