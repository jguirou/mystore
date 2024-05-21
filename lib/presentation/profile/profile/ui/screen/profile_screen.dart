import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/appBar/app_bar.dart';
import 'package:mystore/common/list_tiles/settings_menu_tile.dart';
import 'package:mystore/common/texts/section_heading.dart';
import 'package:mystore/domain/controller/user_controller.dart';
import 'package:mystore/domain/repositories/authentication/authentication_repository.dart';
import 'package:mystore/presentation/profile/edit_profile/ui/screens/edit_profile_screen.dart';
import 'package:mystore/presentation/profile/load_data/ui/screen/load_data_screen.dart';
import 'package:mystore/presentation/profile/my_addresses/my_addresses/ui/screen/my_addresses_screen.dart';
import 'package:mystore/presentation/profile/my_orders/ui/screen%20/my_orders_screen.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/image_strings.dart';
import 'package:mystore/common/shimmers/custom_shimmer.dart';

import '../../../../../common/custom_shapes/primary_header_container.dart';
import '../../../../../common/list_tiles/user_profile_tile.dart';
import '../../../../../utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.defaultSpace),
                child: Column(
                  children: [
                    /// App bar
                    CustomAppBar(
                      title: Text(
                        'Account',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: AppColors.white),
                      ),
                    ),
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : AppImages.animalIcon;

                      return controller.imageLoading.value
                          ? const CustomShimmerEffects(width: 55, height: 55)
                          : UserProfileTile(
                              image: image,
                              userName: controller.user.value.fullName,
                              userMail: controller.user.value.email,
                              onEditPressed: () =>
                                  Get.to(() => const EditProfileScreen()),
                            );
                    }),

                    const SizedBox(height: AppSizes.spaceBtwSections),

                    ///
                  ],
                ),
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  /// title

                  /// Account settings
                  const SectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  SettingsMenuTile(
                    title: 'My addresses',
                    subTitle: 'set shopping delivery address',
                    icon: Icons.home,
                    onTap: () => Get.to(() => const MyAddressesScreen()),
                  ),
                  const SettingsMenuTile(
                      title: 'My cart',
                      subTitle: 'set shopping delivery address',
                      icon: Icons.shopping_bag),
                  SettingsMenuTile(
                    title: 'My orders',
                    subTitle: 'set shopping delivery address',
                    icon: Icons.shopping_bag,
                    onTap: () => Get.to(() => const MyOrdersScreen()),
                  ),
                  const SettingsMenuTile(
                      title: 'My bank account',
                      subTitle: 'set shopping delivery address',
                      icon: Icons.account_balance),
                  const SettingsMenuTile(
                      title: 'My coupons',
                      subTitle: 'set shopping delivery address',
                      icon: Icons.shopify_outlined),
                  const SettingsMenuTile(
                      title: 'Notifications',
                      subTitle: 'set shopping delivery address',
                      icon: Icons.notifications),
                  const SettingsMenuTile(
                      title: 'Account privacy',
                      subTitle: 'set shopping delivery address',
                      icon: Icons.privacy_tip),

                  /// App Settings
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  const SectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                   SettingsMenuTile(
                      title: 'Load Data',
                      subTitle: 'Upload data to your firebase cloud',
                      icon: Icons.upload,
                    onTap: ()=> Get.to(()=> const LoadDataScreen()),
                  ),
                  SettingsMenuTile(
                    title: 'GeoLocation',
                    subTitle: 'Upload data to your firebase cloud',
                    icon: Icons.location_on,
                    trailing: Switch(value: true, onChanged: (val) {}),
                  ),
                  SettingsMenuTile(
                    title: 'Safe mode',
                    subTitle: 'Upload data to your firebase cloud',
                    icon: Icons.security,
                    trailing: Switch(value: false, onChanged: (val) {}),
                  ),
                  SettingsMenuTile(
                    title: 'HD image quality',
                    subTitle: 'Upload data to your firebase cloud',
                    icon: Icons.image,
                    trailing: Switch(value: true, onChanged: (val) {}),
                  ),

                  /// log out button

                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () =>
                              AuthenticationRepository.instance.logout(),
                          child: const Text(
                            'Logout',
                          ))),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections / 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
