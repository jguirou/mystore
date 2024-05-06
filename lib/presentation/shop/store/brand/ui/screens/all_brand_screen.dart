import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mystore/common/appBar/app_bar.dart';
import 'package:mystore/utils/constants/sizes.dart';

import '../../../../../../common/brands/brand_card.dart';
import '../../../../../../common/layouts/grid_layout.dart';
import 'brand_products.dart';
class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              GridLayout(
                  mainAxisExtent: 80,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return BrandCard(
                      showBorder: true,
                      onTap: ()=> Get.to(()=> const BrandProducts()),
                    );
                  }),

            ],
          ),
        ),
      ),
    );
  }
}
