import 'package:flutter/material.dart';
import 'package:mystore/common/layouts/grid_layout.dart';
import 'package:mystore/common/products_card/product_card_vertical.dart';
import 'package:mystore/common/texts/section_heading.dart';
import 'package:mystore/domain/entities/products/product_model.dart';

import '../../../../../../common/brands/brand_showcase.dart';
import '../../../../../../domain/entities/category/category_model.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});
  final CategoryModel category;


  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// brands
              const BrandShowCase(
                images: [
                  AppImages.productImage1,
                  AppImages.productImage2,
                  AppImages.productImage3,
                ], brandTitle: 'Nike',
                brandSubtitle: '256 products',
              ),
              const BrandShowCase(
                images: [
                  AppImages.productImage1,
                  AppImages.productImage2,
                  AppImages.productImage3,
                ], brandTitle: 'Nike',
                brandSubtitle: '256 products',
              ),
              const SizedBox(height: AppSizes.spaceBtwItems,),

              /// Products
              SectionHeading(
                title: 'You might like',
                showActionButton: true,
                onPressed: (){},
              ),
              const SizedBox(height: AppSizes.spaceBtwItems,),
              GridLayout(itemCount: 4,
                  itemBuilder: (context, index) =>  ProductCardVertical( product: ProductModel.empty(),

                  )
              )
            ],
          ),
        )
      ],
    );
  }
}
