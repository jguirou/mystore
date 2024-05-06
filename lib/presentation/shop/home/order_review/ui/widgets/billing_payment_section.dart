import 'package:flutter/material.dart';
import 'package:mystore/common/products_card/rounded_container.dart';
import 'package:mystore/common/texts/section_heading.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../../../utils/constants/image_strings.dart';



class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: (){},
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2,),
        Row(
          children: [
            RoundedContainer(
              width: 60,
              height: 35,
              padding: const EdgeInsets.all(AppSizes.sm),
              backgroundColor: dark ? AppColors.light: AppColors.white,
              child: const Image(image: AssetImage(AppImages.paypalImage), fit: BoxFit.contain,),
            ),
            const SizedBox(width: AppSizes.spaceBtwItems / 2,),
            Text("Paypal", style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
      ],
    );
  }
}