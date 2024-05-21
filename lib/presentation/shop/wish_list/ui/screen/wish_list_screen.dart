import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/icons/circular_icon.dart';
import 'package:mystore/common/layouts/grid_layout.dart';
import 'package:mystore/common/products_card/product_card_vertical.dart';
import 'package:mystore/domain/controller/product_controller.dart';
import 'package:mystore/domain/entities/products/product_model.dart';
import 'package:mystore/navigation_menu.dart';
import 'package:mystore/utils/constants/sizes.dart';

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
      body: SingleChildScrollView(
        padding:const  EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          children: [
            GridLayout(
              itemCount: 4,
                itemBuilder: (context, index){
                 return  ProductCardVertical(product: ProductModel.empty(),);
                }
            ),
          ],
        ),

      ),

    );
  }
}
