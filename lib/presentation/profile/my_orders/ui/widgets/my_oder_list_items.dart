import 'package:flutter/material.dart';

import '../../../../../common/products_card/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          children: [

            ListView.separated(

                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 4,
                separatorBuilder: (__,___)=> const SizedBox(height: AppSizes.spaceBtwItems,),
                itemBuilder: (_, index){
                  return RoundedContainer(
                    showBorder: true,
                    backgroundColor: dark ? AppColors.darkContainer: AppColors.light,
                    padding: const EdgeInsets.all(AppSizes.defaultSpace),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.local_shipping, size: AppSizes.iconMd,),
                                const SizedBox(width: AppSizes.spaceBtwItems,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Processing", style: Theme.of(context).textTheme.titleSmall!.apply(color: AppColors.primary)),
                                    Text("14 Nov 2023", style: Theme.of(context).textTheme.bodyLarge),
                                  ],
                                )

                              ],
                            ),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios, size: AppSizes.iconMd,)),
                          ],
                        ),
                        const SizedBox(height: AppSizes.spaceBtwItems),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.tag, size: AppSizes.iconMd,),
                                  const SizedBox(width: AppSizes.spaceBtwItems,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Order", style: Theme.of(context).textTheme.bodySmall),
                                      Text("[#17541]", style: Theme.of(context).textTheme.bodyLarge),
                                    ],
                                  )

                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.date_range, size: AppSizes.iconMd,),
                                  const SizedBox(width: AppSizes.spaceBtwItems,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Shipping date", style: Theme.of(context).textTheme.bodySmall),
                                        Text("14 Nov 2023", style: Theme.of(context).textTheme.bodyLarge, overflow: TextOverflow.ellipsis,),
                                      ],
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),

                  );
                }
            ),

          ],
        ),
      ),
    );
  }
}