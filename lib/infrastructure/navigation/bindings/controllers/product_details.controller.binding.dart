import 'package:get/get.dart';

import '../../../../presentation/product_details/controllers/product_details.controller.dart';

class ProductDetailsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsController>(
      () => ProductDetailsController(),
    );
  }
}
