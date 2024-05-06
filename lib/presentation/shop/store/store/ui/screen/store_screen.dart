import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/custom_shapes/search_container.dart';
import 'package:mystore/common/layouts/grid_layout.dart';
import 'package:mystore/common/brands/brand_card.dart';
import 'package:mystore/common/products_card/card_counter_icon.dart';
import 'package:mystore/presentation/shop/store/brand/ui/screens/all_brand_screen.dart';
import 'package:mystore/presentation/shop/store/store/ui/widgets/category_tab.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../../../common/appBar/app_bar.dart';
import '../../../../../../common/appBar/tab_bar.dart';
import '../../../../../../common/texts/section_heading.dart';



class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
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
                        onPressed: ()=> Get.to(()=> const AllBrandScreen()),
                      ),
                      const SizedBox(
                        height: AppSizes.spaceBtwItems,
                      ),

                      /// Brand Grid
                      GridLayout(
                          mainAxisExtent: 80,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return BrandCard(
                              showBorder: true,
                              onTap: () {},
                            );
                          }),
                    ],
                  ),
                ),

                /// Tabs
                bottom: const CustomTabBar(tabs: [
                  Tab(
                    child: Text("Sports"),
                  ),
                  Tab(
                    child: Text("Furniture"),
                  ),
                  Tab(
                    child: Text("Electronics"),
                  ),
                  Tab(
                    child: Text("Clothes"),
                  ),
                  Tab(
                    child: Text("Cosmetics"),
                  ),
                ]),
              ),
            ];
          },
          body: const TabBarView(

            children: [
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),

            ],
          ),
        ),
      ),
    );
  }
}


