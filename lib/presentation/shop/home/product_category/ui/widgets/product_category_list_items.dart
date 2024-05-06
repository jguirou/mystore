import 'package:flutter/material.dart';

import '../../../../../../common/products_card/product_card_horizontal.dart';
import '../../../../../../common/texts/section_heading.dart';
import '../../../../../../utils/constants/sizes.dart';

class ProductCategoryListItems extends StatelessWidget {
  const ProductCategoryListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        //scrollDirection: Axis.vertical,
        itemBuilder: (context, index)=> Column(
          children: [
            SectionHeading(
              title: 'Sports Equipements',
              showActionButton: true,
              onPressed: (){},
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),

            SizedBox(


              height: 180,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (__,___)=> const SizedBox(width: AppSizes.spaceBtwItems,),
                  itemBuilder: (_,index)=> const ProductCardHorizontal()
              ),
            ),
          ],
        ),
        separatorBuilder: (_,__)=> const SizedBox(height: AppSizes.spaceBtwSections,),
        itemCount: 2);
  }
}