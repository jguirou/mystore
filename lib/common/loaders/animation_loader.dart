import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/sizes.dart';

/// A widget for displaying an animated loading indicator with optional text and action button.
class AnimationLoaderWidget extends StatelessWidget {
  /// Default constructor for the AnimationLoaderWidget.
  ///
  /// Parameters:
  ///  - text: The text to be displayed below the animation.
  ///  - animation: The path to the lottie animation file.
  ///  - showAction: Wether to show an action button below the text.
  ///  - actionText: The text to be displayed on the animation.
  ///  - onActionPressed: Callback function to be executed when the action button is pressed.
  const AnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
       this.showAction = false,
      this.actionText,
      this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) { 
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8),
          const SizedBox(height: AppSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,

          ),
          const SizedBox(height: AppSizes.defaultSpace),
          showAction ? SizedBox(
            width: 250,
            child: OutlinedButton(
                onPressed: onActionPressed,
                style: OutlinedButton.styleFrom(backgroundColor: AppColors.dark),
                child: Text(
                  actionText!,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColors.light),
                ),
            ),
          ): const SizedBox(),
        ],
      ),
    );
  }
}
