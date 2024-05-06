import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../on_boarding_controller/on_boarding_controller.dart';
import '../widgets/on_boaarding_next_button.dart';
import '../widgets/on_boarding_dot_navigation.dart';
import '../widgets/on_boarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              /*
              OnBoardingPage(
                title: AppTexts.onBoardingTitle1,
                subTitle: AppTexts.onBoardingSubTitle1,
                image: AppImages.onBoardingImage1,
              ),
              OnBoardingPage(
                title: AppTexts.onBoardingTitle2,
                subTitle: AppTexts.onBoardingSubTitle2,
                image: AppImages.onBoardingImage2,
              ),
              OnBoardingPage(
                title: AppTexts.onBoardingTitle3,
                subTitle: AppTexts.onBoardingSubTitle3,
                image: AppImages.onBoardingImage3,
              ),

               */
              Container(
                color: Colors.green,
                child: const Text("data"),
              ),
              Container(

                color: Colors.blue,
                child: const Text("data"),
              ),
              Container(
                color: Colors.purple,
                child: const Text("data"),
              ),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Smooth indicator
          const OnBoardingDotNavigation(),

          /// circular button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}



