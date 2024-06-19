import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/products_card/product_card_vertical.dart';
import 'package:mystore/common/shimmers/vertical_product_shimmer.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/image_strings.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';
import '../../../../../../common/custom_shapes/primary_header_container.dart';
import '../../../../../../common/custom_shapes/search_container.dart';
import '../../../../../../common/layouts/grid_layout.dart';
import '../../../../../../common/texts/section_heading.dart';
import '../../../../../../domain/controller/product_controller.dart';
import '../../../all_product/ui/screen/all_product_screen.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_categories.dart';
import '../widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    
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
                          onPressed: ()=> Get.to(()=>  const AllProductScreen(
                            title: 'Popular categories',
                            //futureMethod: controller.fetchAllFeaturedProducts(),
                          )),
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
                title: 'Popular products',
                showActionButton: true,
                textColor: dark ? AppColors.white: AppColors.dark ,
                onPressed: ()=> Get.to(()=> AllProductScreen(
                  title: 'Popular products',
                  futureMethod: controller.fetchAllFeaturedProducts(),
                )),
              ),
            ),

            /// popular products
            Obx(
              (){
                if(controller.isLoading.value) return  VerticalProductShimmer(itemCount: controller.featuredProducts.length);

                if(controller.featuredProducts.isEmpty){
                  return  Center(child: Text("No Data Found", style: Theme.of(context).textTheme.bodyMedium,));
                } else {
                  return GridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (context, index) {
                        return  ProductCardVertical(product: controller.featuredProducts[index]);
                      });
                }


              }
            ),
          ],
        ),
      ),
    );
  }
}
