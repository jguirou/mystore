import 'package:flutter/material.dart';
import 'package:mystore/common/appBar/app_bar.dart';

import '../../../../../../common/images/rounded_image.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../widgets/product_category_list_items.dart';

class ProductCategoryScreen extends StatelessWidget {
  const ProductCategoryScreen({super.key, this.category});

  final String? category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(category!),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// Promo banner
              RoundedImage(
                width: double.infinity,
                imageUrl: AppImages.promBanner3,
              ),
              SizedBox(height: AppSizes.spaceBtwSections),

              /// Product category list items
              ProductCategoryListItems(),

            ],
          ),
        ),
      ),
    );
  }
}

