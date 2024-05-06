import 'package:flutter/material.dart';
import 'package:mystore/common/styles/spacing_style.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTile,
      required this.onPressed});

  final String image, title, subTile;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// Image asset
              Image(
                height: AppSizes.imageCarouseHeight,
                width: double.infinity,
                alignment: Alignment.center,
                image: AssetImage(image),
              ),
              const SizedBox(height: AppSizes.defaultSpace),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.defaultSpace),
              Text(
                subTile,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),

              /// Continue Button next page
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(AppTexts.myStoreContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
