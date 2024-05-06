import 'package:flutter/material.dart';
import 'package:mystore/common/appBar/app_bar.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../widgets/my_oder_list_items.dart';
class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text('My orders'),
        showBackArrow: true,
      ),
      body: OrderListItems(),
    );
  }
}


