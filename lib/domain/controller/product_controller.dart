import 'package:get/get.dart';
import 'package:mystore/domain/entities/banner/banner_model.dart';
import 'package:mystore/domain/repositories/banners/banner_repository.dart';
import 'package:mystore/utils/constants/enums.dart';

import '../../common/loaders/loaders.dart';
import '../entities/products/product_model.dart';
import '../repositories/products/product_repository.dart';

class ProductController extends GetxController {
  static ProductController get instance=> Get.find();


  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  final Rx<int> carousalCurrentIndex  = 0.obs;
  final isLoading = false.obs;
  final RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  void updatePageIndicator(index){
    carousalCurrentIndex.value = index;
  }

  // fetch banners
  Future<void> fetchFeaturedProducts() async {
    try {
      // Start loading
      isLoading.value = true;
      //FullScreenLoader.openLoadingDialog("Processing..", AppImages.productImage1);
      final productRepo = Get.put(ProductRepository());
      final featuredProducts = await productRepo.getFeaturedProducts();

      // Assign banners
      this.featuredProducts.assignAll(featuredProducts);

    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally{
      // remove loader

      isLoading.value = false;
    }
  }

  /// Get the product price or price range for variations
  String getProductPrice(ProductModel product){
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // If no variations exist  retunr the simple price or sale price
    if(product.productType ==  ProductType.single.toString()){
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    } else {
      // Calculate the smallest and largest prices among variations
      for(var variation in product.productVariations!){
        // Determine the price to consider (sale price if available, otherwise regular price
        double priceToConsider = variation.salePrice! > 0.0 ? variation.salePrice! : variation.price;

        // Update smallest and largest prices
        if(priceToConsider < smallestPrice){
          smallestPrice = priceToConsider;
        }
        if(priceToConsider > largestPrice){
          largestPrice = priceToConsider;
        }
      }
      // if smallest  and largest prices  are the same, return a single price
      if(smallestPrice.isEqual(largestPrice)){
        return largestPrice.toString();
      } else {
        // otherwise, return a price range
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }


  /// Calculate Discount percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice){
    if(salePrice == null || salePrice <= 0.0) return null;
    if(originalPrice <=0) return null;

    double percentage = ((originalPrice-salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  /// Check product stock status
  String getProductStockStatus(int stock){
    return stock > 0 ? 'In Stock': 'Out of Stock';

  }
}