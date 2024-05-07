import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/appBar/app_bar.dart';
import 'package:mystore/presentation/profile/edit_profile/domain/controller/update_name_controller.dart';
import 'package:mystore/utils/constants/sizes.dart';

import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text('Change Name',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
                'Use real name for easy verification. This name will appear on several pages',
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),

            /// Textfield and button
            Form(
                key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) => Validator.validateEmptyText(
                          value, AppTexts.firstName.capitalize!),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.account_circle_outlined),
                          labelText: AppTexts.firstName.capitalize!),
                    ),
                    const SizedBox(height: AppSizes.spaceBtwInputField),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) => Validator.validateEmptyText(
                          value, AppTexts.lastName.capitalize!),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.account_circle_outlined),
                          labelText: AppTexts.lastName.capitalize!),
                    ),
                  ],
                )),
            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),

            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.updateUserName(),
                  child: const Text('Save'),
                )),
          ],
        ),
      ),
    );
  }
}
