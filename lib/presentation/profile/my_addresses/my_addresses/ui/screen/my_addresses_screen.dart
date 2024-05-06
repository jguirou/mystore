import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/appBar/app_bar.dart';
import 'package:mystore/presentation/profile/my_addresses/add_new_address/ui/screen/add_new_address_screen.dart';
import 'package:mystore/utils/constants/sizes.dart';

import '../widgets/my_addresses_card.dart';

class MyAddressesScreen extends StatelessWidget {
  const MyAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Addresses'),
        showBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              MyAddressesCard(
                  name: 'John Doe',
                  phoneNumber: "+337580000",
                  address: "54 bis Rue Raoul Follereau, 78120 Rambouillet",
                selected: true,
              ),
              MyAddressesCard(
                name: 'My Store',
                phoneNumber: "+337580000",
                address: "54 bis Rue Raoul Follereau, 78120 Rambouillet",
              ),
              MyAddressesCard(
                name: 'John Doe',
                phoneNumber: "+337580000",
                address: "54 bis Rue Raoul Follereau, 78120 Rambouillet",

              ),
              MyAddressesCard(
                name: 'John Doe',
                phoneNumber: "+337580000",
                address: "54 bis Rue Raoul Follereau, 78120 Rambouillet",
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: ElevatedButton(
        onPressed: () => Get.to(()=>const AddNewAddressScreen()),
        child: const Icon(Icons.add),

      ),

    );
  }
}


