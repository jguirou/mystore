import 'package:flutter/material.dart';
import 'package:mystore/common/appBar/app_bar.dart';
import 'package:mystore/common/products_card/product_card_vertical.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../../../common/layouts/grid_layout.dart';
import '../../../../../../common/products_card/sortable_products.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: SortableProducts(),
        ),
      ),
    );
  }
}


