import 'package:flutter/material.dart';
import 'package:mystore/common/appBar/app_bar.dart';
import 'package:mystore/utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Add new address'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      labelText: 'Name'),
                ),
                const SizedBox(height: AppSizes.spaceBtwInputField),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone), labelText: 'Phone Number'),
                ),
                const SizedBox(height: AppSizes.spaceBtwInputField),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.home_work),
                            labelText: 'Street'),
                      ),
                    ),
                    const SizedBox(width: AppSizes.spaceBtwInputField),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.code),
                            labelText: 'Postal code'),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: AppSizes.spaceBtwInputField),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.location_city),
                            labelText: 'City'),
                      ),
                    ),
                    const SizedBox(width: AppSizes.spaceBtwInputField),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.local_activity),
                            labelText: 'State'),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: AppSizes.spaceBtwInputField),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.location_city_sharp),
                      labelText: 'Country'),
                ),
                const SizedBox(height: AppSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: const Text("Save"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
