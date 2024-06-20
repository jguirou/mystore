import 'package:flutter/material.dart';
import 'package:mystore/common/appBar/app_bar.dart';
import 'package:mystore/common/brands/brand_card.dart';
import 'package:mystore/common/products_card/sortable_products.dart';
import 'package:mystore/common/shimmers/vertical_product_shimmer.dart';
import 'package:mystore/domain/controller/brand_controller.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/cloud_helper_functions.dart';

import '../../../../../../domain/entities/brands/brand_model.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return  Scaffold(
      appBar:  CustomAppBar(
        title: Text(brand.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              BrandCard(showBorder: true, brand: brand,),
               const SizedBox(height: AppSizes.spaceBtwItems),
              FutureBuilder(
                future: brandController.getBrandProducts(brand.id),
                builder: (context, snapshot) {
                  const loader = VerticalProductShimmer();
                  final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if(widget != null) return widget;

                  final brandProducts = snapshot.data;
                  return  SortableProducts(products: brandProducts!);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
