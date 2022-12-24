import 'package:get/get.dart';

import '../../../../presentation/home/controllers/home.controller.dart';
import '../../../../presentation/home/controllers/products.controller.dart';
import '../domains/product.repository.bindings.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.put<ProductsController>(
      ProductsController(
        productRepository: ProductRepositoryBindings().repository,
      ),
    );
  }
}
