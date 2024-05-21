import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/domain/controller/user_controller.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/image_strings.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../../common/appBar/app_bar.dart';
import '../../../../../common/images/circular_image.dart';
import '../../../../../common/texts/section_heading.dart';
import '../../../../../common/shimmers/custom_shimmer.dart';
import '../widget/edit_profile_tile.dart';
import 'change_name.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leadingIcon: Icons.arrow_back,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace / 1.5),
          child: Column(
            children: [
              Obx(
                  (){
                    final networkImage = controller.user.value.profilePicture;
                    final image = networkImage.isNotEmpty ? networkImage : AppImages.animalIcon;
                    return controller.imageLoading.value
                        ? const CustomShimmerEffects(width: 55, height: 55)
                        : CircularImage(
                      height: 80,
                      width: 80,
                      image: image,
                      backgroundColor: dark ? AppColors.darkGrey : AppColors.grey,
                      isNetworkImage: networkImage.isNotEmpty,
                    );
                  }
              ),
              TextButton(
                  onPressed: () => controller.uploadUserProfilePicture(),
                  child: const Text('Change profile picture')),

              /// Profile Information
              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              const SectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
               EditProfileTile(
                title: controller.user.value.fullName,
                leading: 'Name',
                 onPressed: ()=> Get.to(()=>const ChangeName()),
              ),
               EditProfileTile(
                title: controller.user.value.username,
                leading: 'UserName',

              ),

              /// Personal Information
              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              const SectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
               EditProfileTile(
                title: controller.user.value.id!,
                leading: 'User ID',
                trailing: Icons.copy,
              ),
               EditProfileTile(
                title: controller.user.value.email,
                leading: 'E-Mail',
              ),
               EditProfileTile(
                title: controller.user.value.phoneNumber,
                leading: 'Phone Number',
              ),
              const EditProfileTile(
                title: 'Male',
                leading: 'Gender',
              ),
              const EditProfileTile(
                title: '10, oct 1997',
                leading: 'Date of birth',
              ),

              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems / 2),

              TextButton(
                onPressed: ()=> controller.deleteAccountWarningPopup(),
                child: const Text(
                  'Close account',
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
