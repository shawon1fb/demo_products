import '../../../../domain/core/abstractions/http_connect.interface.dart';
import '../usecase/products.service.interface.dart';
import 'request/all_products.response.dart';

class ProductNetworkService extends IProductService {
  final IHttpConnect _connect;

  ProductNetworkService({required IHttpConnect connect}) : _connect = connect;

  String get _prefix => 'auth';

  @override
  Future<AllProductsResponse> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }
}
