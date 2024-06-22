import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/appBar/app_bar.dart';
import 'package:mystore/common/dummy_data.dart';
import 'package:mystore/common/list_tiles/settings_menu_tile.dart';
import 'package:mystore/common/texts/section_heading.dart';
import 'package:mystore/domain/repositories/banners/banner_repository.dart';
import 'package:mystore/domain/repositories/categories/category_repository.dart';
import 'package:mystore/utils/constants/colors.dart';

import '../../../../../common/custom_shapes/primary_header_container.dart';
import '../../../../../domain/repositories/brands/brand_repository.dart';
import '../../../../../domain/repositories/products/product_repository.dart';
import '../../../../../utils/constants/sizes.dart';

class LoadDataScreen extends StatelessWidget {
  const LoadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryRepository());
    final brandController = Get.put(BrandRepository());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.defaultSpace),
                child: Column(
                  children: [
                    /// App bar
                    CustomAppBar(
                      title: Text(
                        'Upload Data',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: AppColors.white),
                      ),
                      showBackArrow: true,
                    ),

                    ///
                  ],
                ),
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  /// title

                  /// Main record
                  const SectionHeading(
                    title: 'Main record',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  SettingsMenuTile(
                    title: 'Upload Categories',
                    subTitle: '',
                    icon: Icons.category,
                    trailing: IconButton(onPressed: ()=> controller.uploadDummyData(DummyData.categories), icon: const Icon(Icons.upload)),
                    onTap: () {},
                  ),

                  SettingsMenuTile(
                    title: 'Upload Brands',
                    subTitle: '',
                    icon: Icons.store,
                    trailing: IconButton(onPressed: ()=> brandController.uploadDummyData(DummyData.brands), icon: const Icon(Icons.upload)),
                    onTap: () {},
                  ),

                  SettingsMenuTile(
                    title: 'Upload Products',
                    subTitle: '',
                    icon: Icons.shopping_cart,
                    trailing: IconButton(onPressed: ()=> ProductRepository.instance.uploadProducts(DummyData.products), icon: const Icon(Icons.upload)),
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    title: 'Upload Banners',
                    subTitle: '',
                    icon: Icons.image,
                    trailing: IconButton(onPressed: ()=> BannerRepository.instance.uploadBanners(DummyData.banners), icon: const Icon(Icons.upload)),
                    onTap: () {},
                  ),

                  SettingsMenuTile(
                    title: 'Upload Brand Category',
                    subTitle: '',
                    icon: Icons.store,
                    trailing: IconButton(onPressed: ()=> controller.uploadBrandCategory(DummyData.brandCategory), icon: const Icon(Icons.upload)),
                    onTap: () {},
                  ),

                  SettingsMenuTile(
                    title: 'Upload Product category',
                    subTitle: '',
                    icon: Icons.store,
                    trailing: IconButton(onPressed: ()=> controller.uploadProductCategory(DummyData.productCategories), icon: const Icon(Icons.upload)),
                    onTap: () {},
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
