import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/custom_shapes/search_container.dart';
import 'package:mystore/common/layouts/grid_layout.dart';
import 'package:mystore/common/brands/brand_card.dart';
import 'package:mystore/common/products_card/card_counter_icon.dart';
import 'package:mystore/common/shimmers/custom_shimmer.dart';
import 'package:mystore/domain/controller/brand_controller.dart';
import 'package:mystore/domain/controller/category_controller.dart';
import 'package:mystore/presentation/shop/store/brand/ui/screens/all_brand_screen.dart';
import 'package:mystore/presentation/shop/store/brand/ui/screens/brand_products.dart';
import 'package:mystore/presentation/shop/store/store/ui/widgets/category_tab.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../common/appBar/app_bar.dart';
import '../../../../../../common/appBar/tab_bar.dart';
import '../../../../../../common/shimmers/brands_shimmer.dart';
import '../../../../../../common/texts/section_heading.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            CartCounterIcon(
                onPressed: () {},
                iconColor: dark ? AppColors.white : AppColors.darkGrey),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                backgroundColor: dark ? AppColors.dark : AppColors.white,
                automaticallyImplyLeading: false,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(AppSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: AppSizes.spaceBtwItems,
                      ),
                      const SearchContainer(
                        text: 'Search in store',
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: AppSizes.spaceBtwSections,
                      ),

                      /// Featured brands
                      SectionHeading(
                        title: 'Featured Brands',
                        showActionButton: true,
                        textColor: dark ? AppColors.white : AppColors.black,
                        onPressed: () => Get.to(() => const AllBrandScreen()),
                      ),
                      const SizedBox(
                        height: AppSizes.spaceBtwItems,
                      ),

                      /// Brand Grid
                      Obx(
                        (){
                          if(brandController.isLoading.value) return const BrandsShimmer();
                          if(brandController.featuredBrands.isEmpty){
                            return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),);
                          }
                          return GridLayout(
                              mainAxisExtent: 80,
                              itemCount: brandController.featuredBrands.length,
                              itemBuilder: (context, index) {
                                final brand = brandController.featuredBrands[index];
                                return BrandCard(
                                  showBorder: true,
                                  brand: brand,
                                  onTap: ()=> Get.to(()=> BrandProducts(brand: brand)),
                                );
                              });
                        }
                      ),
                    ],
                  ),
                ),

                /// Tabs
                bottom: CustomTabBar(
                  tabs: categories
                      .map((category) => Tab(
                            child: Text(category.name),
                          ))
                      .toList(),
                ),
              ),
            ];
          },
          body:  TabBarView(
            children: categories.map((category) => CategoryTab(category: category,)).toList(),
          ),
        ),
      ),
    );
  }
}
