import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mystore/common/product_title_text.dart';
import 'package:mystore/common/products_card/rounded_container.dart';
import 'package:mystore/common/texts/product_price_text.dart';
import 'package:mystore/common/texts/section_heading.dart';
import 'package:mystore/domain/controller/variation_controller.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../../../common/chips/custom_choice_chip.dart';
import '../../../../../../domain/entities/products/product_model.dart';

class ProductAttribute extends StatelessWidget {
  const ProductAttribute({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
      () => Column(
        children: [
          /// Selected Attribute pricing & description
          // Display variation price and stock when some variation is selected
          if (controller.selectedVariation.value.id.isNotEmpty)
            RoundedContainer(
              padding: const EdgeInsets.all(AppSizes.md),
              backgroundColor: dark ? AppColors.darkGrey : AppColors.grey,
              child: Column(
                children: [
                  /// Title, price and stock status
                  Row(
                    children: [
                      const SectionHeading(
                        title: 'Variation:',
                        showActionButton: false,
                      ),
                      const SizedBox(
                        width: AppSizes.spaceBtwItems,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Price
                          Row(
                            children: [
                              const ProductTitleText(
                                title: 'Price:',
                                smallSize: true,
                              ),
                              const SizedBox(
                                width: AppSizes.spaceBtwItems,
                              ),

                              /// Actual price
                              if (controller
                                      .selectedVariation.value.salePrice! >
                                  0)
                                Text(
                                  '\$${controller.selectedVariation.value.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),
                              const SizedBox(width: AppSizes.spaceBtwItems),

                              /// Sale Price
                              ProductPriceText(
                                  price: controller.getVariationPrice()),
                            ],
                          ),

                          /// Stock
                          Row(
                            children: [
                              const ProductTitleText(
                                title: 'Stock:',
                                smallSize: true,
                              ),
                              const SizedBox(
                                width: AppSizes.spaceBtwItems,
                              ),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium!,
                              ),
                              const SizedBox(width: AppSizes.spaceBtwItems),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: AppSizes.spaceBtwItems,
                      ),
                    ],
                  ),

                  /// Variation description
                  ///
                   ProductTitleText(
                    title:
                        controller.selectedVariation.value.description ?? '',
                    smallSize: true,
                    maxLines: 4,
                  ),
                ],
              ),
            ),

          const SizedBox(
            height: AppSizes.spaceBtwItems,
          ),

          /// Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeading(
                          title: attribute.name ?? '',
                          showActionButton: false,
                        ),
                        const SizedBox(height: AppSizes.spaceBtwItems / 2),
                        Obx(() {
                          return Wrap(
                            spacing: 8,
                            children: attribute.values!.map((attributeValue) {
                              final isSelected = controller
                                      .selectedAttributes[attribute.name] ==
                                  attributeValue;
                              final available = controller
                                  .getAttributesAvailabilityInVariation(
                                      product.productVariations!,
                                      attribute.name!)
                                  .contains(attributeValue);
                              return CustomChoiceChip(
                                text: attributeValue,
                                selected: isSelected,
                                onSelected: available
                                    ? (selected) {
                                        if (selected && available) {
                                          controller.onAttributeSelected(
                                              product,
                                              attribute.name ?? '',
                                              attributeValue);
                                        }
                                      }
                                    : null,
                              );
                            }).toList(),
                          );
                        }),
                      ],
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
