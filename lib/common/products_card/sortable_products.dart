import 'package:flutter/material.dart';
import 'package:mystore/common/products_card/product_card_vertical.dart';

import '../../utils/constants/sizes.dart';
import '../layouts/grid_layout.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        DropdownButtonFormField(
          items: ['Name', 'Higher Price', 'Lower price', 'Sale', 'Newest', 'Popularity'].map((option){
            return DropdownMenuItem(
              value: option,
              child: Text(option),
            );
          } ).toList(),
          onChanged: (val){},
          decoration: const InputDecoration(
            border: InputBorder.none,


            prefixIcon: Icon(Icons.sort),

          ),
        ),

        const SizedBox(height: AppSizes.spaceBtwSections),
        /// Product items

        GridLayout(
          itemCount: 20,
          itemBuilder: (_ , index ) {
            return const ProductCardVertical();
          },

        ),
      ],

      ///

      ///

    );
  }
}