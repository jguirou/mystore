import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/appBar/app_bar.dart';
import 'package:mystore/domain/controller/brand_controller.dart';
import 'package:mystore/domain/entities/brands/brand_model.dart';
import 'package:mystore/utils/constants/sizes.dart';

import '../../../../../../common/brands/brand_card.dart';
import '../../../../../../common/layouts/grid_layout.dart';
import '../../../../../../common/shimmers/brands_shimmer.dart';
import 'brand_products.dart';
class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text('Brand'),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text('Brand', style: Theme.of(context).textTheme.headlineLarge, textAlign: TextAlign.start,),
              const SizedBox(height: AppSizes.spaceBtwItems),
              /// Brand Grid
              Obx(
                      (){
                    if(controller.isLoading.value) return const BrandsShimmer();
                    if(controller.allBrands.isEmpty){
                      return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),);
                    }
                    return GridLayout(
                        mainAxisExtent: 80,
                        itemCount: controller.allBrands.length,
                        itemBuilder: (context, index) {
                          final brand = controller.allBrands[index];
                          return BrandCard(
                            showBorder: true,
                            brand: brand,
                            onTap: () => Get.to(()=>  BrandProducts(brand: brand,)),
                          );
                        });
                  }
              ),

            ],
          ),
        ),
      ),
    );
  }
}
