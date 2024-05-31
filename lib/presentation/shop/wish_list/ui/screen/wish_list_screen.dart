import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/icons/circular_icon.dart';
import 'package:mystore/navigation_menu.dart';

import '../../../../../common/appBar/app_bar.dart';
class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        title: Text("WhishList", style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          CircularIcon(onPressed: ()=> Get.to( const NavigationMenu()), icon: Icons.add,)
        ],

      ),
      body: const Center(child: Text('Coming soon...', textAlign: TextAlign.center,),)

    );
  }
}
