import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/domain/entities/products/product_model.dart';
import 'package:mystore/utils/constants/sizes.dart';

class ImagesController extends GetxController{
  static ImagesController get instance => Get.find();

  /// Variables
  RxString selectProductImage = ''.obs;

  /// Get all images from products and variables
  List<String> getAllProductsImages(ProductModel product){
    // Use set to add unique images only
    Set<String> images ={};

    // load thumbnail image
    images.add(product.thumbnail);

    // Assign thumbnail as Selected images
    selectProductImage.value = product.thumbnail;

    // Get all images from the product model if not null
    if(product.images != null){
      images.addAll(product.images!);
    }

    // Get all images from the product variations if not null
    if(product.productVariations != null || product.productVariations!.isNotEmpty ){
      images.addAll(product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  /// Show Images popup
  void showEnlargedImage(String image){
    Get.to(
      fullscreenDialog: true,
        ()=> Dialog.fullscreen(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSizes.defaultSpace *2, horizontal: AppSizes.defaultSpace),
                child: CachedNetworkImage(imageUrl: image),

              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 150,
                  child: OutlinedButton(
                    onPressed: ()=>Get.back(),
                    child: const Text('Close'),
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }

}