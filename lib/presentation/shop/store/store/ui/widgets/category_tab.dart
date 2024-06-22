import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mystore/common/layouts/grid_layout.dart';
import 'package:mystore/common/products_card/product_card_vertical.dart';
import 'package:mystore/common/shimmers/vertical_product_shimmer.dart';
import 'package:mystore/common/texts/section_heading.dart';
import 'package:mystore/domain/controller/category_controller.dart';
import 'package:mystore/domain/entities/products/product_model.dart';
import 'package:mystore/presentation/shop/home/all_product/ui/screen/all_product_screen.dart';
import 'package:mystore/presentation/shop/store/store/ui/widgets/category_brands.dart';
import 'package:mystore/utils/helpers/cloud_helper_functions.dart';

import '../../../../../../common/brands/brand_showcase.dart';
import '../../../../../../domain/entities/category/category_model.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});
  final CategoryModel category;


  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// brands
              CategoryBrands(category: category),
              const SizedBox(height: AppSizes.spaceBtwItems,),

              /// Products
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {

                  final response = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: const VerticalProductShimmer());
                  if(response != null) return response;

                  final products = snapshot.data!;
                  return Column(
                    children: [
                      SectionHeading(
                        title: 'You might like',
                        showActionButton: true,
                        onPressed: ()=> Get.to(()=> AllProductScreen(title: category.name, futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1),),
                        ),
                      ),
                      const SizedBox(height: AppSizes.spaceBtwItems,),
                      GridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) => ProductCardVertical(product: products[index])
                      ),
                    ],
                  );
                }
              ),

            ],
          ),
        )
      ],
    );
  }
}
