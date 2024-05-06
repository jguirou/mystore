import 'package:flutter/material.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/image_strings.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../../common/appBar/app_bar.dart';
import '../../../../../common/images/circular_image.dart';
import '../../../../../common/texts/section_heading.dart';
import '../widget/edit_profile_tile.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
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
              CircularImage(
                height: 80,
                width: 80,
                image: AppImages.animalIcon,
                backgroundColor: dark ? AppColors.darkGrey : AppColors.grey,
              ),
              TextButton(
                  onPressed: () {},
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
              const EditProfileTile(
                title: 'Jean Guirou',
                leading: 'Name',
              ),
              const EditProfileTile(
                title: 'jean_guirou',
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
              const EditProfileTile(
                title: '4509',
                leading: 'User ID',
                trailing: Icons.copy,
              ),
              const EditProfileTile(
                title: 'jeanguirou@yahoo.com',
                leading: 'E-Mail',
              ),
              const EditProfileTile(
                title: '0700000',
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
                onPressed: () {},
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
