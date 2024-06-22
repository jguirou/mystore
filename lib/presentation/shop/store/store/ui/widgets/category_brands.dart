import 'package:mystore/common/shimmers/custom_shimmer.dart';
import 'package:mystore/domain/controller/brand_controller.dart';
import 'package:mystore/domain/entities/category/category_model.dart';
import 'package:mystore/utils/constants/sizes.dart';

import '../../../../../../common/brands/brand_showcase.dart';
import '../../../../../../common/shimmers/boxes_shimmer.dart';
import '../../../../../../common/shimmers/list_tile_shimmer.dart';
import '../../../../../../common/shimmers/vertical_product_shimmer.dart';
import '../../../../../../utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/helpers/cloud_helper_functions.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        // check the state of FutureBuilder snapshot
        const loader = Column(
          children: [
            ListTileShimmer(),
            SizedBox(height: AppSizes.spaceBtwItems,),
            BoxesShimmer(),
            SizedBox(height: AppSizes.spaceBtwItems,),
          ],
        );
        final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

        // return appropriate widget based on snapshot state
        if(widget != null) return widget;
        // Product found
        final brands = snapshot.data!;
        return  ListView.builder(
          shrinkWrap: true,
            itemCount: brands.length,
            physics: const NeverScrollableScrollPhysics(),

            itemBuilder: (_,index){
              final brand = brands[index];
              return  FutureBuilder(
                future: controller.getBrandProducts(brandId:brand.id, limit: 3),
                builder: (context, snapshot) {

                  final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

                  // return appropriate widget based on snapshot state
                  if(widget != null) return widget;
                  // Product found
                  final products = snapshot.data!;
                  return BrandShowCase(

                    images: products.map((product) => product.thumbnail).toList(),
                    brand: brand,
                  );
                }
              );
            }
        );
      }
    );
  }
}

