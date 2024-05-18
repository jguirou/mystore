import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/domain/controller/category_controller.dart';
import 'package:mystore/presentation/shop/home/home/ui/widgets/category_shimmer.dart';
import 'package:mystore/utils/shimmer/custom_shimmer.dart';

import '../../../../../../common/texts/vertical_image_texts.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../product_category/ui/screen/product_category_screen.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());


    return Obx(() {
      if(categoryController.isLoading.value) const CategoryShimmer();
      if(categoryController.featuredCategories.isEmpty){
        return Center(child: Text('No data found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),);
      }
      return SizedBox(
              height: 80,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: categoryController.featuredCategories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    final category = categoryController.featuredCategories[index];
                    return VerticalImageText(
                      image: category.image,
                      title: category.name,
                      onTap: ()=> Get.to(()=>  ProductCategoryScreen( category: category.name,)),
                    );
                  }),
            );
    });
  }
}
