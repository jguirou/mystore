import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class CouponCode extends StatelessWidget {
  const CouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Have a promo code? Enter here',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(top: AppSizes.sm, bottom: AppSizes.sm, left: AppSizes.sm,right: AppSizes.sm),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.grey,
                          side: const BorderSide(color: Colors.transparent)
                      ),
                      onPressed: (){},
                      child: const Text('Apply'),
                    ),
                  )
              ),
            )
          ],
        )
    );
  }
}