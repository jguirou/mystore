import 'package:get/get.dart';
import 'package:mystore/domain/entities/banner/banner_model.dart';
import 'package:mystore/domain/repositories/banners/banner_repository.dart';

import '../../common/loaders/loaders.dart';

class BannerController extends GetxController {
  static BannerController get instance=> Get.find();


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  final Rx<int> carousalCurrentIndex  = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  void updatePageIndicator(index){
    carousalCurrentIndex.value = index;
  }

  // fetch banners
  Future<void> fetchBanners() async {
    try {
      // Start loading
      isLoading.value = true;
      //FullScreenLoader.openLoadingDialog("Processing..", AppImages.productImage1);
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // Assign banners
      this.banners.assignAll(banners);

    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally{
      // remove loader

      isLoading.value = false;
    }
  }
}