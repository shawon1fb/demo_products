import '../product/request/all_products.response.dart';

abstract class IProductService {
  Future<AllProductsResponse> getAllProducts();
}
