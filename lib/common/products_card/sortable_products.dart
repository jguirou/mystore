import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mystore/common/products_card/product_card_vertical.dart';
import 'package:mystore/domain/controller/all_products_controller.dart';

import '../../domain/entities/products/product_model.dart';
import '../../utils/constants/sizes.dart';
import '../layouts/grid_layout.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key, required this.products,
  });
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    final sortOptions = ['Name', 'Higher Price', 'Lower price','Newest', 'Sale'];
    return Column(
      children: [

        Obx(() {
          return DropdownButtonFormField<String>(
            value: controller.selectedSortOption.value,
            items: sortOptions.map((option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: (val) {
              if (val != null) {
                controller.sortProducts(val);
                controller.selectedSortOption.value = val;
              }
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.sort),
            ),
          );
        }),

        const SizedBox(height: AppSizes.spaceBtwSections),
        /// Product items

        Obx(
         ()=> GridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_ , index ) {
              return  ProductCardVertical(product: controller.products[index],);
            },

          ),
        ),
      ],

      ///

      ///

    );
  }
}