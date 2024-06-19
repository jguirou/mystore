import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mystore/common/appBar/app_bar.dart';
import 'package:mystore/common/shimmers/vertical_product_shimmer.dart';
import 'package:mystore/domain/controller/all_products_controller.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/cloud_helper_functions.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../../../common/products_card/sortable_products.dart';
import '../../../../../../domain/entities/products/product_model.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key, required this.title, this.query, this.futureMethod});
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(AllProductsController());
    return  Scaffold(
      appBar: CustomAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              // check the state of FutureBuilder snapshot
              const loader = VerticalProductShimmer( );
              final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

              // return appropriate widget based on snapshot state
              if(widget != null) return widget;
              // Product found
              final products = snapshot.data;
              return  SortableProducts(products: products!,);
            }
          ),
        ),
      ),
    );
  }
}


