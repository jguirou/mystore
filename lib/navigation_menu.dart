import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/presentation/profile/profile/ui/screen/profile_screen.dart';
import 'package:mystore/presentation/shop/home/home/ui/screen/home_screen.dart';
import 'package:mystore/presentation/shop/store/store/ui/screen/store_screen.dart';
import 'package:mystore/presentation/shop/wish_list/ui/screen/wish_list_screen.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/texts.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = HelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index)=> controller.selectedIndex.value = index,
          backgroundColor: darkMode ? AppColors.dark : AppColors.white,
          indicatorColor: darkMode ? AppColors.white.withOpacity(0.1) : AppColors.dark.withOpacity(0.1),
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home),
                label: AppTexts.home
            ),
            NavigationDestination(
                icon: Icon(Icons.store),
                label: AppTexts.store
            ),
            NavigationDestination(
                icon: Icon(Icons.favorite),
                label: AppTexts.wishList
            ),
            NavigationDestination(
                icon: Icon(Icons.account_circle_outlined),
                label: AppTexts.profile
            ),


          ],

        ),
      ),
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final  screens = [const HomeScreen(), const StoreScreen(),const WishListScreen(),const ProfileScreen()];
}
