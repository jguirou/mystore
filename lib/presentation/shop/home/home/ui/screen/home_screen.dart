import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/products_card/product_card_vertical.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/image_strings.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';
import '../../../../../../common/custom_shapes/primary_header_container.dart';
import '../../../../../../common/custom_shapes/search_container.dart';
import '../../../../../../common/layouts/grid_layout.dart';
import '../../../../../../common/texts/section_heading.dart';
import '../../../all_product/ui/screen/all_product_screen.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_categories.dart';
import '../widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> promoBanners = [
      AppImages.promBanner1,
      AppImages.promBanner2,
      AppImages.promBanner3,
    ];
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  /// App bar
                  const HomeAppBar(),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  /// searchbar
                  SearchContainer(
                    text: 'Search in store',
                    onTap: () {},
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                   Padding(
                    padding: const EdgeInsets.only(left: AppSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// Heading
                        SectionHeading(
                          title: 'Popular categories',
                          showActionButton: false,
                          textColor: AppColors.white,
                          onPressed: ()=> Get.to(()=> const AllProductScreen()),
                        ),
                        const SizedBox(height: AppSizes.spaceBtwItems),

                        /// Categories
                         const HomeCategories(
                         ),


                        ///
                      ],
                    ),

                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),


            /// promo slider

            const Padding(
              padding: EdgeInsets.all(AppSizes.defaultSpace),
              child: PromoSlider(),
            ),
            //const SizedBox(height: AppSizes.spaceBtwSections),
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.defaultSpace, right: AppSizes.defaultSpace),
              child: SectionHeading(
                title: 'Popular categories',
                showActionButton: true,
                textColor: dark ? AppColors.white: AppColors.dark ,
                onPressed: ()=> Get.to(()=> const AllProductScreen()),
              ),
            ),

            /// popular products
            GridLayout(
              itemCount: 8,
                itemBuilder: (context, index) {
              return const ProductCardVertical();
            }),
          ],
        ),
      ),
    );
  }
}
