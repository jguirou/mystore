import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mystore/domain/controller/images_controller.dart';
import 'package:mystore/domain/entities/products/product_model.dart';
import 'package:mystore/domain/entities/products/product_variation_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  /// Variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  /// select attribute, and variation
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    // When attribute is selected we will first add that attribute to the selectedAttributes
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
        (variation) => _isSameAttributeValues(
            variation.attributesValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty());
    // Show the selected variation image as a main image
    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectProductImage.value =
          selectedVariation.image;
    }

    // Assign selected variation
    this.selectedVariation.value = selectedVariation;

    // Update selected product variation status
    getProductVariationStockStatus();
  }

  /// Check if selected attributes matches any variation attributes
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    // if selectedAttributes contains 3 attributes and current variation 2 then return
    if (variationAttributes.length != selectedAttributes.length) return false;

    // If any of attributes is different then return e.g [Green, Large] x [Green, Small]
    for (final key in variationAttributes.keys) {
      // Attributes[key] = Value which could be [Green,  Small, Cotton] etc
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;
  }

  /// Check attribute availability/ stock in variation
  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    // Pass the variations to check which attributes are available and stock is not 0
    final availableVariationAttributeValues = variations
        .where((variation) =>
            // check empty / out of stock selectedAttributes
            variation.attributesValues[attributeName] != null &&
            variation.attributesValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        // fetch all non empty attributes of variations
        .map((variation) => variation.attributesValues[attributeName])
        .toSet();
    return availableVariationAttributeValues;
  }


  String getVariationPrice(){
    return (selectedVariation.value.salePrice! > 0 ?  selectedVariation.value.salePrice: selectedVariation.value.price).toString();
  }

  /// Check product variation stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  /// Reset selected attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
