import 'package:flutter/material.dart';
import 'package:mystore/common/appBar/app_bar.dart';
import 'package:mystore/common/brands/brand_card.dart';
import 'package:mystore/common/products_card/sortable_products.dart';
import 'package:mystore/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text('Nike'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              BrandCard(showBorder: true),
               SizedBox(height: AppSizes.spaceBtwItems),
              SortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
