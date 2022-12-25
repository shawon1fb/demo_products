import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import '../../../domain/core/data_model/product.data.model.dart';
import '../../../domain/core/pagination/pagination_model.dart';
import '../../../domain/repository/usecase/product.repository.interface.dart';
import '../enums/home.enums.dart';

class ProductsController extends GetxController {
  final IProductRepository _productRepository;

  ProductsController({required IProductRepository productRepository})
      : _productRepository = productRepository;

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  @override
  void onClose() {
    _allProducts.clear();
    super.onClose();
  }

  bool isLoading = false;

  Future<void> getAllProducts() async {
    try {
      isLoading = true;
      PaginationModel<ProductDataModel> res =
          await _productRepository.getAllProduct();
      _allProducts.addAll(res.list);
    } catch (e, t) {
      if (kDebugMode) {
        print(e);
        print(t);
      }
    } finally {
      isLoading = false;
      update([Home.product_list]);
    }
  }

  List<ProductDataModel> get allProducts => _allProducts.toList();
  final Set<ProductDataModel> _allProducts = <ProductDataModel>{};
}
